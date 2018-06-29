# frozen_string_literal: true

require 'gcp_backend'
require 'time'
require 'google/apis/cloudkms_v1'

module Inspec::Resources
  class GoogleKMSCryptoKey < GcpResourceBase
    name 'google_kms_crypto_key'
    desc 'Verifies settings for a KMS key ring'

    example "
      describe google_kms_crypto_key(project: 'chef-inspec-gcp',   location: 'us-east1',  key_ring_name: 'key-ring', name: 'crypto-key') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @kms_crypto_key = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).get_project_location_key_ring_crypto_key("projects/#{opts[:project]}/locations/#{opts[:location]}/keyRings/#{opts[:key_ring_name]}/cryptoKeys/#{opts[:name]}")
        create_resource_methods(@kms_crypto_key)
      end
    end

    def crypto_key_name
      return false if !defined?(name)
      name.split('/').last
    end

    def create_time_date
      return false if !defined?(create_time)
      Time.parse(create_time)
    end

    # this is added for completeness as crypto key IAM bindings use the crypto_key_url as an identifier
    def crypto_key_url
      return false if !defined?(name)
      name
    end

    def next_rotation_time_date
      return false if !defined?(next_rotation_time)
      Time.parse(next_rotation_time)
    end

    def primary_create_time_date
      return false if !defined?(primary.create_time)
      Time.parse(primary.create_time)
    end

    def primary_name
      return false if !defined?(primary.name)
      primary.name
    end

    def primary_state
      return false if !defined?(primary.state)
      primary.state
    end

    def exists?
      !@kms_crypto_key.nil?
    end

    def to_s
      "Crytpo Key #{@display_name}"
    end
  end
end
