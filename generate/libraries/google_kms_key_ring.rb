# frozen_string_literal: true

require 'gcp_backend'
require 'time'
require 'google/apis/cloudkms_v1'

module Inspec::Resources
  class GoogleKMSKeyRing < GcpResourceBase
    name 'google_kms_key_ring'
    desc 'Verifies settings for a KMS key ring'

    example "
      describe google_kms_key_ring(project: 'chef-inspec-gcp',  location: 'us-east1', name: 'key-ring-name') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @kms_key_ring = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).get_project_location_key_ring("projects/#{opts[:project]}/locations/#{opts[:location]}/keyRings/#{opts[:name]}")
        create_resource_methods(@kms_key_ring)
      end
    end

    def key_ring_name
      return '' if !defined?(name) || name.nil?
      name.split('/').last
    end

    def create_time_date
      return false if !defined?(create_time) || create_time.nil?
      Time.parse(create_time)
    end

    # this is added for completeness as key ring IAM bindings use the key_ring_url as an identifier
    def key_ring_url
      return '' if !defined?(name) || name.nil?
      name
    end

    def exists?
      !@kms_key_ring.nil?
    end

    def to_s
      "Key Ring #{@display_name}"
    end
  end
end
