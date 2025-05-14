# frozen_string_literal: false

require 'gcp_backend'
require 'google/parametermanager/property/policy_member'

class ParameterManagerParameters < GcpResourceBase
  name 'google_parameter_manager_parameters'
  desc 'Parameter plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:update_times, field: :update_time)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:formats, field: :format)
  filter_table_config.add(:policy_members, field: :policy_member)
  filter_table_config.add(:kms_keys, field: :kms_key)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('parameters')
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
      'name' => ->(obj) { [:name, obj['name']] },
      'createTime' => ->(obj) { [:create_time, obj['createTime']] },
      'labels' => ->(obj) { [:labels, obj['labels'] || {}] },
      'kmsKey' => ->(obj) { [:kms_key, obj['kmsKey'] || {}] },
      'updateTime' => ->(obj) { [:update_time, obj['updateTime']] },
      'format' => ->(obj) { [:format, obj['format']] },
      'policyMember' => ->(obj) { [:policy_member, GoogleInSpec::ParameterManager::Property::PolicyMember.new(obj['policyMember'], to_s)] },
    }
  end

  private

  def product_url(_ = nil)
    if @params[:region] && @params[:region] != 'global'
      "https://parametermanager.#{@params[:region]}.rep.googleapis.com/v1/"
    else
      'https://parametermanager.googleapis.com/v1/'
    end
  end

  def resource_base_url
    '{{parent}}/parameters'
  end
end
