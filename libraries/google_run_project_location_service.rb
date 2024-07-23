# frozen_string_literal: false

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
require 'gcp_backend'
require 'google/run/property/projectlocationservice_metadata'
require 'google/run/property/projectlocationservice_metadata_annotations'
require 'google/run/property/projectlocationservice_metadata_labels'
require 'google/run/property/projectlocationservice_metadata_owner_references'
require 'google/run/property/projectlocationservice_spec'
require 'google/run/property/projectlocationservice_spec_template'
require 'google/run/property/projectlocationservice_spec_template_metadata'
require 'google/run/property/projectlocationservice_spec_template_metadata_annotations'
require 'google/run/property/projectlocationservice_spec_template_metadata_labels'
require 'google/run/property/projectlocationservice_spec_template_metadata_owner_references'
require 'google/run/property/projectlocationservice_spec_template_spec'
require 'google/run/property/projectlocationservice_spec_template_spec_containers'
require 'google/run/property/projectlocationservice_spec_template_spec_image_pull_secrets'
require 'google/run/property/projectlocationservice_spec_template_spec_node_selector'
require 'google/run/property/projectlocationservice_spec_template_spec_volumes'
require 'google/run/property/projectlocationservice_spec_traffic'
require 'google/run/property/projectlocationservice_status'
require 'google/run/property/projectlocationservice_status_address'
require 'google/run/property/projectlocationservice_status_conditions'
require 'google/run/property/projectlocationservice_status_traffic'

# A provider to manage run resources.
class RunProjectLocationService < GcpResourceBase
  name 'google_run_project_location_service'
  desc 'ProjectLocationService'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :api_version
  attr_reader :kind
  attr_reader :metadata
  attr_reader :spec
  attr_reader :status

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @api_version = @fetched['apiVersion']
    @kind = @fetched['kind']
    @metadata = GoogleInSpec::Run::Property::ProjectLocationServiceMetadata.new(@fetched['metadata'], to_s)
    @spec = GoogleInSpec::Run::Property::ProjectLocationServiceSpec.new(@fetched['spec'], to_s)
    @status = GoogleInSpec::Run::Property::ProjectLocationServiceStatus.new(@fetched['status'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ProjectLocationService #{@params}"
  end

  private

  def product_url(_ = nil)
    'https://run.googleapis.com//v2/'
  end

  def resource_base_url
    '{{+name}}'
  end
end
