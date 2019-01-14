# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleKMSCryptoKeys < GcpResourceBase
    name 'google_kms_crypto_keys'
    desc 'Verifies settings for GCP KMS crypto keys in bulk'

    example "
      describe google_kms_crypto_keys(project: 'chef-inspec-gcp',   location: 'us-east1',  crypto_key_name: 'key-ring') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @location = opts[:location]
      @key_ring_name = opts[:key_ring_name]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:crypto_key_names, field: :crypto_key_name)
    filter_table_config.add(:crypto_key_urls, field: :crypto_key_url)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      crypto_key_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @crypto_keys = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).list_project_location_key_ring_crypto_keys("projects/#{@project}/locations/#{@location}/keyRings/#{@key_ring_name}", page_token: next_page)
        end
        return [] if !@crypto_keys || !@crypto_keys.crypto_keys
        @crypto_keys.crypto_keys.map do |crypto_key|
          crypto_key_rows += [{ crypto_key_name: crypto_key.name.split('/').last,
                                crypto_key_url: crypto_key.name }]
        end
        next_page = @crypto_keys.next_page_token
        break unless next_page
      end
      @table = crypto_key_rows
    end
  end
end
