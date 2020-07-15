# frozen_string_literal: false

require "gcp_backend"
require "google/compute/property/disk_disk_encryption_key"
require "google/compute/property/disk_source_image_encryption_key"
require "google/compute/property/disk_source_snapshot_encryption_key"

# A provider to manage Compute Engine resources.
class RegionalDisk < GcpResourceBase
  name "google_compute_regional_disk"
  desc "RegionalDisk"
  supports platform: "gcp"

  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :params
  attr_reader :description
  attr_reader :size_gb
  attr_reader :zone
  attr_reader :source_snapshot
  attr_reader :source_snapshot_id
  attr_reader :source_snapshot_encryption_key
  attr_reader :source_image
  attr_reader :source_image_id
  attr_reader :source_image_encryption_key
  attr_reader :type
  attr_reader :licenses
  attr_reader :last_attach_timestamp
  attr_reader :last_detach_timestamp
  attr_reader :users
  attr_reader :disk_encryption_key
  attr_reader :labels
  attr_reader :label_fingerprint
  attr_reader :physical_block_size_bytes
  attr_reader :region
  attr_reader :replica_zones
  attr_reader :status

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched["id"]
    @creation_timestamp = parse_time_string(@fetched["creationTimestamp"])
    @name = @fetched["name"]
    @size_gb = @fetched["sizeGb"]
    @type = @fetched["type"]
    @label_fingerprint = @fetched["labelFingerprint"]
    @region = @fetched["region"]
    @replica_zones = @fetched["replicaZones"]
    @physical_block_size_bytes = @fetched["physicalBlockSizeBytes"]
    @description = @fetched["description"]
    @last_attach_timestamp = parse_time_string(@fetched["lastAttachTimestamp"])
    @last_detach_timestamp = parse_time_string(@fetched["lastDetachTimestamp"])
    @labels = @fetched["labels"]
    @licenses = @fetched["licenses"]
    @users = @fetched["users"]
    @source_image = @fetched["sourceImage"]
    @zone = @fetched["zone"]
    @source_image_encryption_key = GoogleInSpec::Compute::Property::DiskSourceImageEncryptionKey.new(@fetched["sourceImageEncryptionKey"], to_s)
    @source_image_id = @fetched["sourceImageId"]
    @disk_encryption_key = GoogleInSpec::Compute::Property::DiskDiskEncryptionKey.new(@fetched["diskEncryptionKey"], to_s)
    @source_snapshot = @fetched["sourceSnapshot"]
    @source_snapshot_encryption_key = GoogleInSpec::Compute::Property::DiskSourceSnapshotEncryptionKey.new(@fetched["sourceSnapshotEncryptionKey"], to_s)
    @source_snapshot_id = @fetched["sourceSnapshotId"]
    @stat = @fetched["status"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionalDisk #{@params[:name]}"
  end

  private

  def product_url
    "https://www.googleapis.com/compute/v1/"
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/disks/{{name}}"
  end
end
