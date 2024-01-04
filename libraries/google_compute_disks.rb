

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
class ComputeDisks < GcpResourceBase
  name "google_compute_disks"
  desc "Disk plural resource"
  supports platform: "gcp"

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:last_attach_timestamps, field: :last_attach_timestamp)
  filter_table_config.add(:last_detach_timestamps, field: :last_detach_timestamp)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:licenses, field: :licenses)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:size_gbs, field: :size_gb)
  filter_table_config.add(:users, field: :users)
  filter_table_config.add(:physical_block_size_bytes, field: :physical_block_size_bytes)
  filter_table_config.add(:interfaces, field: :interface)
  filter_table_config.add(:types, field: :type)
  filter_table_config.add(:source_images, field: :source_image)
  filter_table_config.add(:resource_policies, field: :resource_policies)
  filter_table_config.add(:multi_writers, field: :multi_writer)
  filter_table_config.add(:zones, field: :zone)
  filter_table_config.add(:source_image_encryption_keys, field: :source_image_encryption_key)
  filter_table_config.add(:source_image_ids, field: :source_image_id)
  filter_table_config.add(:disk_encryption_keys, field: :disk_encryption_key)
  filter_table_config.add(:source_snapshots, field: :source_snapshot)
  filter_table_config.add(:source_snapshot_encryption_keys, field: :source_snapshot_encryption_key)
  filter_table_config.add(:source_snapshot_ids, field: :source_snapshot_id)

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
      "labelFingerprint" => ->(obj) { [:label_fingerprint, obj["labelFingerprint"]] },
      "creationTimestamp" => ->(obj) { [:creation_timestamp, parse_time_string(obj["creationTimestamp"])] },
      "description" => ->(obj) { [:description, obj["description"]] },
      "id" => ->(obj) { [:id, obj["id"]] },
      "lastAttachTimestamp" => ->(obj) { [:last_attach_timestamp, parse_time_string(obj["lastAttachTimestamp"])] },
      "lastDetachTimestamp" => ->(obj) { [:last_detach_timestamp, parse_time_string(obj["lastDetachTimestamp"])] },
      "labels" => ->(obj) { [:labels, obj["labels"]] },
      "licenses" => ->(obj) { [:licenses, obj["licenses"]] },
      "name" => ->(obj) { [:name, obj["name"]] },
      "sizeGb" => ->(obj) { [:size_gb, obj["sizeGb"]] },
      "users" => ->(obj) { [:users, obj["users"]] },
      "physicalBlockSizeBytes" => ->(obj) { [:physical_block_size_bytes, obj["physicalBlockSizeBytes"]] },
      "interface" => ->(obj) { [:interface, obj["interface"]] },
      "type" => ->(obj) { [:type, obj["type"]] },
      "sourceImage" => ->(obj) { [:source_image, obj["sourceImage"]] },
      "resourcePolicies" => ->(obj) { [:resource_policies, obj["resourcePolicies"]] },
      "multiWriter" => ->(obj) { [:multi_writer, obj["multiWriter"]] },
      "zone" => ->(obj) { [:zone, obj["zone"]] },
      "sourceImageEncryptionKey" => ->(obj) { [:source_image_encryption_key, GoogleInSpec::Compute::Property::DiskSourceImageEncryptionKey.new(obj["sourceImageEncryptionKey"], to_s)] },
      "sourceImageId" => ->(obj) { [:source_image_id, obj["sourceImageId"]] },
      "diskEncryptionKey" => ->(obj) { [:disk_encryption_key, GoogleInSpec::Compute::Property::DiskDiskEncryptionKey.new(obj["diskEncryptionKey"], to_s)] },
      "sourceSnapshot" => ->(obj) { [:source_snapshot, obj["sourceSnapshot"]] },
      "sourceSnapshotEncryptionKey" => ->(obj) { [:source_snapshot_encryption_key, GoogleInSpec::Compute::Property::DiskSourceSnapshotEncryptionKey.new(obj["sourceSnapshotEncryptionKey"], to_s)] },
      "sourceSnapshotId" => ->(obj) { [:source_snapshot_id, obj["sourceSnapshotId"]] },
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
    "projects/{{project}}/zones/{{zone}}/disks"
  end
end
