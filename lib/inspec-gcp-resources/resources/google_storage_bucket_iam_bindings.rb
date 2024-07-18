# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBucketIamBindings < GcpResourceBase
    name 'google_storage_bucket_iam_bindings'
    desc 'Verifies settings for GCP storage bucket IAM bindings in bulk'

    example "
      describe google_storage_bucket_iam_bindings(bucket: 'bucket-buvsjjcndqz') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      iam_binding_rows = []
      catch_gcp_errors do
        @iam_bindings = @gcp.gcp_storage_client.get_bucket_iam_policy(@bucket)
      end
      return [] if !@iam_bindings || !@iam_bindings.bindings
      @iam_bindings.bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @table = iam_binding_rows
    end
  end
end
