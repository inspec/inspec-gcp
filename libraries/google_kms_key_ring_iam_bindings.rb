# frozen_string_literal: false

require 'gcp_backend'
require 'time'

module Inspec::Resources
  class GoogleKMSKeyRingIAMBindings < GcpResourceBase
    name 'google_kms_key_ring_iam_bindings'
    desc 'Verifies settings for GCP KMS key ring IAM bindings in bulk'

    example "
      describe google_kms_key_ring_iam_bindings(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring') do
        it { should exist }
      end
    "
    attr_reader :params
    attr_reader :table

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @key_ring_url = params[:key_ring_url]
      @params = params
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
      parse unless @fetched.nil?
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :table)

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
      '{{key_ring_url}}:getIamPolicy'
    end
  end
end
