# frozen_string_literal: false

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
    attr_reader :params
    attr_reader :table

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :table)

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @crypto_key_url = params[:crypto_key_url]
      @params = params
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
      parse unless @fetched.nil?
    end

    def parse
      iam_binding_rows = []
      return [] if !@fetched || !@fetched['bindings']
      @iam_bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)

      @iam_bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @table = iam_binding_rows
    end

    private

    def product_url
      'https://cloudkms.googleapis.com/v1/'
    end

    def resource_base_url
      '{{crypto_key_url}}:getIamPolicy'
    end
  end
end
