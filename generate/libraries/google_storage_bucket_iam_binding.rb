# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBucketIamBinding < GcpResourceBase
    name 'google_storage_bucket_iam_binding'
    desc 'Verifies settings for a storage bucket IAM binding'

    example "
      describe google_storage_bucket_iam_binding(bucket: 'bucket-buvsjjcndqz',  role: 'roles/storage.objectViewer') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
      @role = opts[:role]
      @iam_binding_exists = false
      @members_list=[]
      catch_gcp_errors do
        # note this is the same call as for the plural iam_bindings resource because there isn't an easy way to pull out a singular binding
        @iam_bindings = @gcp.gcp_storage_client.get_bucket_iam_policy(@bucket)
        raise Inspec::Exceptions::ResourceFailed, "google_storage_bucket_iam_binding is missing expected IAM policy 'bindings' property" if !@iam_bindings || !@iam_bindings.bindings
        @iam_bindings.bindings.each do |binding|
          next if binding.role != @role
          @iam_binding_exists=true
          @members_list=binding.members
        end
      end
    end

    # return the list of users corresponding to the role
    def members
      @members_list
    end

    def exists?
      @iam_binding_exists
    end

    def to_s
      "Storage Bucket IAM Binding #{@role}"
    end
  end
end
