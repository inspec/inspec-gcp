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
require 'google/compute/property/regionsecuritypolicy_configuration_constraints'
require 'google/compute/property/regionsecuritypolicy_configuration_constraints_bgp_peer_asn_ranges'
require 'google/compute/property/regionsecuritypolicy_labels'
require 'google/compute/property/regionsecuritypolicy_partner_metadata'
require 'google/compute/property/regionsecuritypolicy_private_interconnect_info'

# A provider to manage Compute Engine resources.
class ComputeRegionSecurityPolicy < GcpResourceBase
  name 'google_compute_region_security_policy'
  desc 'RegionSecurityPolicy'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :kind
  attr_reader :description
  attr_reader :self_link
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :interconnect
  attr_reader :router
  attr_reader :region
  attr_reader :google_reference_id
  attr_reader :mtu
  attr_reader :private_interconnect_info
  attr_reader :operational_status
  attr_reader :cloud_router_ip_address
  attr_reader :customer_router_ip_address
  attr_reader :type
  attr_reader :pairing_key
  attr_reader :admin_enabled
  attr_reader :vlan_tag8021q
  attr_reader :edge_availability_domain
  attr_reader :candidate_subnets
  attr_reader :bandwidth
  attr_reader :partner_metadata
  attr_reader :labels
  attr_reader :label_fingerprint
  attr_reader :state
  attr_reader :partner_asn
  attr_reader :encryption
  attr_reader :ipsec_internal_addresses
  attr_reader :dataplane_version
  attr_reader :satisfies_pzs
  attr_reader :stack_type
  attr_reader :cloud_router_ipv6_address
  attr_reader :customer_router_ipv6_address
  attr_reader :candidate_ipv6_subnets
  attr_reader :cloud_router_ipv6_interface_id
  attr_reader :customer_router_ipv6_interface_id
  attr_reader :subnet_length
  attr_reader :remote_service
  attr_reader :configuration_constraints

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @kind = @fetched['kind']
    @description = @fetched['description']
    @self_link = @fetched['selfLink']
    @id = @fetched['id']
    @creation_timestamp = @fetched['creationTimestamp']
    @name = @fetched['name']
    @interconnect = @fetched['interconnect']
    @router = @fetched['router']
    @region = @fetched['region']
    @google_reference_id = @fetched['googleReferenceId']
    @mtu = @fetched['mtu']
    @private_interconnect_info = GoogleInSpec::Compute::Property::RegionSecurityPolicyPrivateInterconnectInfo.new(@fetched['privateInterconnectInfo'], to_s)
    @operational_status = @fetched['operationalStatus']
    @cloud_router_ip_address = @fetched['cloudRouterIpAddress']
    @customer_router_ip_address = @fetched['customerRouterIpAddress']
    @type = @fetched['type']
    @pairing_key = @fetched['pairingKey']
    @admin_enabled = @fetched['adminEnabled']
    @vlan_tag8021q = @fetched['vlanTag8021q']
    @edge_availability_domain = @fetched['edgeAvailabilityDomain']
    @candidate_subnets = @fetched['candidateSubnets']
    @bandwidth = @fetched['bandwidth']
    @partner_metadata = GoogleInSpec::Compute::Property::RegionSecurityPolicyPartnerMetadata.new(@fetched['partnerMetadata'], to_s)
    @labels = GoogleInSpec::Compute::Property::RegionSecurityPolicyLabels.new(@fetched['labels'], to_s)
    @label_fingerprint = @fetched['labelFingerprint']
    @state = @fetched['state']
    @partner_asn = @fetched['partnerAsn']
    @encryption = @fetched['encryption']
    @ipsec_internal_addresses = @fetched['ipsecInternalAddresses']
    @dataplane_version = @fetched['dataplaneVersion']
    @satisfies_pzs = @fetched['satisfiesPzs']
    @stack_type = @fetched['stackType']
    @cloud_router_ipv6_address = @fetched['cloudRouterIpv6Address']
    @customer_router_ipv6_address = @fetched['customerRouterIpv6Address']
    @candidate_ipv6_subnets = @fetched['candidateIpv6Subnets']
    @cloud_router_ipv6_interface_id = @fetched['cloudRouterIpv6InterfaceId']
    @customer_router_ipv6_interface_id = @fetched['customerRouterIpv6InterfaceId']
    @subnet_length = @fetched['subnetLength']
    @remote_service = @fetched['remoteService']
    @configuration_constraints = GoogleInSpec::Compute::Property::RegionSecurityPolicyConfigurationConstraints.new(@fetched['configurationConstraints'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionSecurityPolicy #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/interconnectAttachments/{{interconnect_attachment}}/{{name}}'
  end
end
