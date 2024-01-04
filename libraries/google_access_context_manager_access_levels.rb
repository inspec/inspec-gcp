

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
require "gcp_backend"
class AccessContextManagerAccessLevels < GcpResourceBase
  name "google_access_context_manager_access_levels"
  desc "AccessLevel plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:titles, field: :title)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:basics, field: :basic)
  filter_table_config.add(:customs, field: :custom)
  filter_table_config.add(:parents, field: :parent)
  filter_table_config.add(:names, field: :name)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("accessLevels")
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, "Get")
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
      "title" => ->(obj) { [:title, obj["title"]] },
      "description" => ->(obj) { [:description, obj["description"]] },
      "basic" => ->(obj) { [:basic, GoogleInSpec::AccessContextManager::Property::AccessLevelBasic.new(obj["basic"], to_s)] },
      "custom" => ->(obj) { [:custom, GoogleInSpec::AccessContextManager::Property::AccessLevelCustom.new(obj["custom"], to_s)] },
      "parent" => ->(obj) { [:parent, name_from_self_link(obj["parent"])] },
      "name" => ->(obj) { [:name, name_from_self_link(obj["name"])] },
    }
  end

  private

  def product_url(_ = nil)
    "https://accesscontextmanager.googleapis.com/v1/"
  end

  def resource_base_url
    "accessPolicies/{{parent}}/accessLevels"
  end
end
