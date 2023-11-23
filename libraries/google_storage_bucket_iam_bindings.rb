# frozen_string_literal: false

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
    attr_reader :params
    attr_reader :table



    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @params = params
      @bucket = params[:bucket]
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
      parse unless @fetched.nil?
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :table)

    def parse
      iam_binding_rows = []
      return [] if !@fetched || !@fetched['bindings']
      @bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)
      @bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @table = iam_binding_rows
    end
    def to_s
      "Bucket IamBinding #{@params[:bucket]} Role: #{@params[:role]}"
    end
    private

    def product_url
      'https://storage.googleapis.com/storage/v1/'
    end

    def resource_base_url
      'b/{{bucket}}/iam'
    end
  end
end
