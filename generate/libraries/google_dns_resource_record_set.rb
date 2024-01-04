

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

# A provider to manage Cloud DNS resources.
class DNSResourceRecordSet < GcpResourceBase
  name "google_dns_resource_record_set"
  desc "ResourceRecordSet"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :name
  attr_reader :type
  attr_reader :ttl
  attr_reader :target
  attr_reader :managed_zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    fetched = @connection.fetch(product_url, resource_base_url, params, "Get")
    @fetched = unwrap(fetched, params)
    parse unless @fetched.nil?
  end

  def identity
    %w{name type}
  end

  def collection_item
    "rrsets"
  end

  def unwrap(fetched, params)
    fetched[collection_item].find { |result| identity.all? { |id| result[id.to_sym] == params[id] } }
  end

  def parse
    @name = @fetched["name"]
    @type = @fetched["type"]
    @ttl = @fetched["ttl"]
    @target = @fetched["rrdatas"]
    @managed_zone = @fetched["managed_zone"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ResourceRecordSet #{@params[:type]}"
  end

  def un_parse
    {
      "name" => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      "type" => ->(x, _) { x.nil? ? [] : ["its('type') { should cmp #{x.inspect} }"] },
      "ttl" => ->(x, _) { x.nil? ? [] : ["its('ttl') { should cmp #{x.inspect} }"] },
      "target" => ->(x, _) { x.nil? ? [] : x.map { |single| "its('target') { should include #{single.inspect} }" } },
      "managed_zone" => ->(x, _) { x.nil? ? [] : ["its('managed_zone') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = "ResourceRecordSet"

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name:,
      arr:,
      type: "google_dns_resource_record_set",
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", "w") do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    "https://www.googleapis.com/dns/v1/"
  end

  def resource_base_url
    "projects/{{project}}/managedZones/{{managed_zone}}/rrsets?name={{name}}&type={{type}}"
  end
end
