# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
class IAMServiceAccounts < GcpResourceBase
  name 'google_service_accounts'
  desc 'ServiceAccount plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:service_account_names, field: :service_account_name)
  filter_table_config.add(:project_ids, field: :project_id)
  filter_table_config.add(:service_account_ids, field: :service_account_id)
  filter_table_config.add(:service_account_emails, field: :service_account_email)
  filter_table_config.add(:service_account_display_names, field: :service_account_display_name)
  filter_table_config.add(:oauth2_client_ids, field: :oauth2_client_id)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('accounts')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'name' => ->(obj) { [:service_account_name, obj['name']] },
      'projectId' => ->(obj) { [:project_id, obj['projectId']] },
      'uniqueId' => ->(obj) { [:service_account_id, obj['uniqueId']] },
      'email' => ->(obj) { [:service_account_email, obj['email']] },
      'displayName' => ->(obj) { [:service_account_display_name, obj['displayName']] },
      'oauth2ClientId' => ->(obj) { [:oauth2_client_id, obj['oauth2ClientId']] },
    }
  end

  private

  def product_url(_ = nil)
    'https://iam.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/serviceAccounts'
  end
end
