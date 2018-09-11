# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageDefaultObjectAcl < GcpResourceBase
    name 'google_storage_default_object_acl'
    desc 'Verifies settings for a storage default object ACL'

    example "
      describe google_storage_default_object_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
      @entity = opts[:entity]
      begin
        @acl = @gcp.gcp_storage_client.get_default_object_access_control(@bucket, @entity)
        create_resource_methods(@acl)
      # all non-existing entities raise a "Not Found" client error
      rescue Google::Apis::ClientError => e
        @acl=nil
        @error=JSON.parse(e.body)
      end
    end

    def exists?
      !@acl.nil?
    end

    attr_reader :error

    def to_s
      "Storage Default Object ACL #{@bucket} #{@entity}"
    end
  end
end
