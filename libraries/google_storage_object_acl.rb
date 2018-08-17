# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageObjectAcl < GcpResourceBase
    name 'google_storage_object_acl'
    desc 'Verifies settings for a storage object ACL'

    example "
      describe google_storage_object_acl(bucket: 'bucket-buvsjjcndqz', object: 'bucket-object-pmxbiikq', entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
      @object = opts[:object]
      @entity = opts[:entity]
      catch_gcp_errors do
        @acl = @gcp.gcp_storage_client.get_object_access_control(@bucket, @object, @entity)
        create_resource_methods(@acl)
      end
    end

    def exists?
      !@acl.nil?
    end

    def to_s
      "Storage Object ACL #{@object}"
    end
  end
end
