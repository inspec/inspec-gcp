# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBucket < GcpResourceBase
    name 'google_storage_bucket'
    desc 'Verifies settings for a bucket'

    example "
      describe google_storage_bucket(name: 'inspec-test-bucket') do
        it { should exist }
        its('storage_class') { should eq 'REGIONAL' }
        its('location') { should eq 'US-CENTRAL1' }
        its('lifecycle') { should eq 'enabled' }
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @bucket = @gcp.gcp_storage_client.get_bucket(opts[:name])
        create_resource_methods(@bucket)
      end
    end

    def exists?
      !@bucket.nil?
    end

    def has_versioning_enabled?
      return false if !defined?(@bucket.versioning)
      return false if @bucket.versioning.nil?
      @bucket.versioning.enabled
    end

    def has_logging_enabled?
      return false if !defined?(@bucket.logging)
      return false if @bucket.logging.nil?
      true
    end

    def to_s
      "Bucket #{@display_name}"
    end
  end
end
