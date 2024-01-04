

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

# A provider to manage Vertex AI resources.
class VertexAIDatasetsAnnotationSpec < GcpResourceBase
  name "google_vertex_ai_datasets_annotation_spec"
  desc "DatasetsAnnotationSpec"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :display_name
  attr_reader :name
  attr_reader :etag
  attr_reader :create_time
  attr_reader :update_time

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @display_name = @fetched["displayName"]
    @name = @fetched["name"]
    @etag = @fetched["etag"]
    @create_time = @fetched["createTime"]
    @update_time = @fetched["updateTime"]
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "DatasetsAnnotationSpec #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://{{region}}-aiplatform.googleapis.com/v1/"
  end

  def resource_base_url
    "{{name}}"
  end
end
