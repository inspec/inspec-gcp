

require "gcp_backend"
class RegionalDisks < GcpResourceBase
  name "google_compute_regional_disks"
  desc "RegionalDisk plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:size_gbs, field: :size_gb)
  filter_table_config.add(:zones, field: :zone)
  filter_table_config.add(:source_snapshots, field: :source_snapshot)
  filter_table_config.add(:source_snapshot_ids, field: :source_snapshot_id)
  filter_table_config.add(:source_snapshot_encryption_keys, field: :source_snapshot_encryption_key)
  filter_table_config.add(:source_images, field: :source_image)
  filter_table_config.add(:source_image_ids, field: :source_image_id)
  filter_table_config.add(:source_image_encryption_keys, field: :source_image_encryption_key)
  filter_table_config.add(:types, field: :type)
  filter_table_config.add(:licenses, field: :licenses)
  filter_table_config.add(:last_attach_timestamps, field: :last_attach_timestamp)
  filter_table_config.add(:last_detach_timestamps, field: :last_detach_timestamp)
  filter_table_config.add(:users, field: :users)
  filter_table_config.add(:disk_encryption_keys, field: :disk_encryption_key)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:physical_block_size_bytes, field: :physical_block_size_bytes)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:replica_zones, field: :replica_zone)
  filter_table_config.add(:statuses, field: :status)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource("items")
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
      "id" => ->(obj) { [:id, obj["id"]] },
      "creationTimestamp" => ->(obj) { [:creation_timestamp, parse_time_string(obj["creationTimestamp"])] },
      "name" => ->(obj) { [:name, obj["name"]] },
      "description" => ->(obj) { [:description, obj["description"]] },
      "sizeGb" => ->(obj) { [:size_gb, obj["sizeGb"]] },
      "zone" => ->(obj) { [:zone, obj["zone"]] },
      "sourceSnapshot" => ->(obj) { [:source_snapshot, obj["sourceSnapshot"]] },
      "sourceSnapshotId" => ->(obj) { [:source_snapshot_id, obj["sourceSnapshotId"]] },
      "sourceSnapshotEncryptionKey" => ->(obj) { [:source_snapshot_encryption_key, GoogleInSpec::Compute::Property::DiskSourceSnapshotEncryptionKey.new(obj["sourceSnapshotEncryptionKey"], to_s)] },
      "sourceImage" => ->(obj) { [:source_image, obj["sourceImage"]] },
      "sourceImageId" => ->(obj) { [:source_image_id, obj["sourceImageId"]] },
      "sourceImageEncryptionKey" => ->(obj) { [:source_image_encryption_key, GoogleInSpec::Compute::Property::DiskSourceImageEncryptionKey.new(obj["sourceImageEncryptionKey"], to_s)] },
      "type" => ->(obj) { [:type, obj["type"]] },
      "licenses" => ->(obj) { [:licenses, obj["licenses"]] },
      "lastAttachTimestamp" => ->(obj) { [:last_attach_timestamp, parse_time_string(obj["lastAttachTimestamp"])] },
      "lastDetachTimestamp" => ->(obj) { [:last_detach_timestamp, parse_time_string(obj["lastDetachTimestamp"])] },
      "users" => ->(obj) { [:users, obj["users"]] },
      "diskEncryptionKey" => ->(obj) { [:disk_encryption_key, GoogleInSpec::Compute::Property::DiskDiskEncryptionKey.new(obj["diskEncryptionKey"], to_s)] },
      "labels" => ->(obj) { [:labels, obj["labels"]] },
      "labelFingerprint" => ->(obj) { [:label_fingerprint, obj["labelFingerprint"]] },
      "physicalBlockSizeBytes" => ->(obj) { [:physical_block_size_bytes, obj["physicalBlockSizeBytes"]] },
      "region" => ->(obj) { [:region, obj["region"]] },
      "replica_zones" => ->(obj) { [:replica_zones, obj["replica_zones"]] },
      "status" => ->(obj) { [:status, obj["status"]] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(beta = false)
    if beta
      "https://compute.googleapis.com/compute/beta/"
    else
      "https://compute.googleapis.com/compute/v1/"
    end
  end

  def resource_base_url
    "projects/{{project}}/regions/{{region}}/disks"
  end
end
