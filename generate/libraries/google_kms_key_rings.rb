# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleKMSKeyRings < GcpResourceBase
    name 'google_kms_key_rings'
    desc 'Verifies settings for GCP KMS key rings in bulk'

    example "
      describe google_kms_key_rings(project: 'chef-inspec-gcp', location: 'us-east1') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @location = opts[:location]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:key_ring_names, field: :key_ring_name)
    filter_table_config.add(:key_ring_urls, field: :key_ring_url)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      key_ring_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @key_rings = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).list_project_location_key_rings("projects/#{@project}/locations/#{@location}", page_token: next_page)
        end
        return [] if !@key_rings || !@key_rings.key_rings
        @key_rings.key_rings.map do |key_ring|
          key_ring_rows += [{ key_ring_name: key_ring.name.split('/').last,
                              key_ring_url: key_ring.name }]
        end
        next_page = @key_rings.next_page_token
        break unless next_page
      end
      @table = key_ring_rows
    end
  end
end
