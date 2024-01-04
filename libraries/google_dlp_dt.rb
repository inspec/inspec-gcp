

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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
require "google/dlp/property/dt_config"
require "google/dlp/property/dt_config_info_type_tf"
require "google/dlp/property/dt_config_info_type_tf_tf"

# A provider to manage Dlp resources.
class DLPDT < GcpResourceBase
  name "google_dlp_dt"
  desc "DT"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :name
  attr_reader :description
  attr_reader :display_name
  attr_reader :config
  attr_reader :parent

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched["name"]
    @description = @fetched["description"]
    @display_name = @fetched["displayName"]
    @config = GoogleInSpec::DLP::Property::DTConfig.new(@fetched["config"], to_s)
    @parent = @fetched["parent"]
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "DT #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://dlp.googleapis.com/v2/"
  end

  def resource_base_url
    "{{parent}}/deidentifyTemplates/{{name}}"
  end
end
