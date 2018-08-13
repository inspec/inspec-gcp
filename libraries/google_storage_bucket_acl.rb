# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBucketAcl < GcpResourceBase
    name 'google_storage_bucket_acl'
    desc 'Verifies settings for a storage bucket ACL'

    example "
      describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
      @entity = opts[:entity]
      catch_gcp_errors do
        @acl = @gcp.gcp_storage_client.get_bucket_access_control(@bucket, @entity)
        create_resource_methods(@acl)
      end
    end

    def exists?
      !@acl.nil?
    end

    def to_s
      "Storage Bucket ACL #{@bucket}"
    end
  end
end
