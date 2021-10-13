# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/dns_v2beta1'

module Inspec::Resources
  class GoogleDnsManagedZones < GcpResourceBase
    name 'google_dns_managed_zones'
    desc 'Verifies settings for GCP DNS managed zones in bulk'

    example "
      describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:zone_ids, field: :zone_id)
    filter_table_config.add(:zone_names, field: :zone_name)
    filter_table_config.add(:zone_dns_names, field: :zone_dns_name)
    filter_table_config.add(:dnssec_config_states, field: :dnssec_config_state)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      managed_zones = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @managed_zones = @gcp.gcp_client(Google::Apis::DnsV2beta1::DnsService).list_managed_zones(@project, page_token: next_page)
        end
        return [] if !@managed_zones || !@managed_zones.managed_zones
        @managed_zones.managed_zones.map do |zone|
          dns_enabled=false
          if defined?(zone.dnssec_config.state)
            dns_enabled=true if zone.dnssec_config.state == 'on'
          end
          managed_zones+=[{ zone_id: zone.id,
                            zone_name: zone.name,
                            zone_dns_name: zone.dns_name,
                            dnssec_config_state: dns_enabled }]
        end
        next_page = @managed_zones.next_page_token
        break unless next_page
      end
      @table = managed_zones
    end
  end
end
