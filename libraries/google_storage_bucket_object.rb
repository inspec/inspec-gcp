# frozen_string_literal: true

require 'gcp_backend'
require 'time'

module Inspec::Resources
  class GoogleStorageBucketObject < GcpResourceBase
    name 'google_storage_bucket_object'
    desc 'Verifies settings for a storage bucket object'

    example "
      describe google_storage_bucket_object(bucket: 'bucket-buvsjjcndqz',  object: 'bucket-object-pmxbiikq') do
        it { should exist }
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
      @object = opts[:object]
      catch_gcp_errors do
        @bucket_object = @gcp.gcp_storage_client.get_object(@bucket, @object)
        @time_created = @bucket_object.time_created
        @time_updated = @bucket_object.updated
        @time_class_updated = @bucket_object.time_storage_class_updated
        create_resource_methods(@bucket_object)
      end
    end

    def updated_date
      return false if !defined?(@time_updated) || @time_updated.nil?
      Time.parse(@time_updated.to_s)
    end

    def time_storage_class_updated_date
      return false if !defined?(@time_class_updated) || @time_class_updated.nil?
      Time.parse(@time_class_updated.to_s)
    end

    def time_created_date
      return false if !defined?(@time_created) || @time_created.nil?
      Time.parse(@time_created.to_s)
    end

    def exists?
      !@bucket_object.nil?
    end

    def to_s
      "Bucket object #{@bucket}/#{@object}"
    end
  end
end
