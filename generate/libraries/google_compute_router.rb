

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
require "google/compute/property/router_bgp"
require "google/compute/property/router_bgp_advertised_ip_ranges"

# A provider to manage Compute Engine resources.
class ComputeRouter < GcpResourceBase
  name "google_compute_router"
  desc "Router"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :description
  attr_reader :network
  attr_reader :bgp
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, "Get")
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @id = @fetched["id"]
    @creation_timestamp = parse_time_string(@fetched["creationTimestamp"])
    @name = @fetched["name"]
    @description = @fetched["description"]
    @network = @fetched["network"]
    @bgp = GoogleInSpec::Compute::Property::RouterBgp.new(@fetched["bgp"], to_s)
    @region = @fetched["region"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Router #{@params[:name]}"
  end

  def un_parse
    {
      "id" => ->(x, _) { x.nil? ? [] : ["its('id') { should cmp #{x.inspect} }"] },
      "creation_timestamp" => ->(x, _) { x.nil? ? [] : ["its('creation_timestamp.to_s') { should cmp '#{x.inspect}' }"] },
      "name" => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      "description" => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      "network" => ->(x, _) { x.nil? ? [] : ["its('network') { should cmp #{x.inspect} }"] },
      "bgp" => ->(x, _) { x.nil? ? [] : GoogleInSpec::Compute::Property::RouterBgp.un_parse(x, "bgp") },
      "region" => ->(x, _) { x.nil? ? [] : ["its('region') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = "Router"

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name:,
      arr:,
      type: "google_compute_router",
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", "w") do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    "https://www.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/routers/{{name}}"
  end
end
