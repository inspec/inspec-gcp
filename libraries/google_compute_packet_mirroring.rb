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
require 'google/compute/property/packetmirroring_collector_ilb'
require 'google/compute/property/packetmirroring_filter'
require 'google/compute/property/packetmirroring_mirrored_resources'
require 'google/compute/property/packetmirroring_mirrored_resources_instances'
require 'google/compute/property/packetmirroring_mirrored_resources_subnetworks'
require 'google/compute/property/packetmirroring_network'

# A provider to manage Compute Engine resources.
class ComputePacketMirroring < GcpResourceBase
  name 'google_compute_packet_mirroring'
  desc 'PacketMirroring'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :kind
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :self_link
  attr_reader :self_link_with_id
  attr_reader :name
  attr_reader :description
  attr_reader :region
  attr_reader :network
  attr_reader :priority
  attr_reader :collector_ilb
  attr_reader :mirrored_resources
  attr_reader :filter
  attr_reader :enable

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @kind = @fetched['kind']
    @id = @fetched['id']
    @creation_timestamp = @fetched['creationTimestamp']
    @self_link = @fetched['selfLink']
    @self_link_with_id = @fetched['selfLinkWithId']
    @name = @fetched['name']
    @description = @fetched['description']
    @region = @fetched['region']
    @network = GoogleInSpec::Compute::Property::PacketMirroringNetwork.new(@fetched['network'], to_s)
    @priority = @fetched['priority']
    @collector_ilb = GoogleInSpec::Compute::Property::PacketMirroringCollectorIlb.new(@fetched['collectorIlb'], to_s)
    @mirrored_resources = GoogleInSpec::Compute::Property::PacketMirroringMirroredResources.new(@fetched['mirroredResources'], to_s)
    @filter = GoogleInSpec::Compute::Property::PacketMirroringFilter.new(@fetched['filter'], to_s)
    @enable = @fetched['enable']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "PacketMirroring #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/packetMirrorings/{{name}}'
  end
end