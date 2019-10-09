# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleKMSCryptoKeyIAMBindings < GcpResourceBase
    name 'google_kms_crypto_key_iam_bindings'
    desc 'Verifies settings for GCP KMS Crypto Key IAM Bindings in bulk'

    example "
      describe google_kms_key_ring_iam_bindings(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @crypto_key_url = opts[:crypto_key_url]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      iam_binding_rows = []
      catch_gcp_errors do
        @iam_bindings = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).get_project_location_key_ring_crypto_key_iam_policy(@crypto_key_url)
      end
      return [] if !@iam_bindings || !@iam_bindings.bindings
      @iam_bindings.bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @table = iam_binding_rows
    end
  end
end
