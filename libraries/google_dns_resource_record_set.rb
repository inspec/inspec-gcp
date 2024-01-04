

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
    fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
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
    fetched[collection_item].find { |result| identity.all? { |id| result[id] == params[id.to_sym] } }
  end

  def parse
    @name = @fetched["name"]
    @type = @fetched["type"]
    @ttl = @fetched["ttl"]
    @target = @fetched["rrdatas"]
    @managed_zone = @fetched["managed_zone"]
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ResourceRecordSet #{@params[:type]}"
  end

  private

  def product_url(beta = false)
    if beta
      "https://dns.googleapis.com/dns/v1beta2/"
    else
      "https://dns.googleapis.com/dns/v1/"
    end
  end

  def resource_base_url
    "projects/{{project}}/managedZones/{{managed_zone}}/rrsets?name={{name}}&type={{type}}"
  end
end
