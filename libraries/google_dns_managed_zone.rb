# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleDnsManagedZone < GcpResourceBase
    name 'google_dns_managed_zone'
    desc 'Verifies settings for a GCP DNS managed zone'

    example "
      describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: 'zone-name') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @managed_zone = @gcp.gcp_client(Google::Apis::DnsV2beta1::DnsService).get_managed_zone(opts[:project], opts[:zone])
        create_resource_methods(@managed_zone)
        @key_specs = {}
        if defined?(@managed_zone.dnssec_config.default_key_specs) && !@managed_zone.dnssec_config.default_key_specs.nil?
          @managed_zone.dnssec_config.default_key_specs.each do |spec|
            @key_specs[spec.key_type] = spec.algorithm
          end
        end
      end
    end

    def exists?
      !@managed_zone.nil?
    end

    def creation_time_date
      return false if !defined?(@managed_zone.creation_time) || @managed_zone.creation_time.nil?
      Time.parse(@managed_zone.creation_time)
    end

    def key_signing_key_algorithm
      raise Inspec::Exceptions::ResourceFailed, "google_dns_managed_zone is missing expected property 'dnssec_config.default_key_specs KEY_SIGNING'" if !@key_specs.key?('KEY_SIGNING')
      @key_specs['KEY_SIGNING']
    end

    def zone_signing_key_algorithm
      raise Inspec::Exceptions::ResourceFailed, "google_dns_managed_zone is missing expected property 'dnssec_config.default_key_specs ZONE_SIGNING'" if !@key_specs.key?('ZONE_SIGNING')
      @key_specs['ZONE_SIGNING']
    end

    def to_s
      "DNS Managed Zone #{@display_name}"
    end
  end
end
