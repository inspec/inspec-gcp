

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
require "google/compute/property/imagefamilyview_image_source_snapshot_encryption_key_dbs"
require "google/compute/property/imagefamilyview_image_source_snapshot_encryption_key_dbxs"
require "google/compute/property/imagefamilyview_image_source_snapshot_encryption_key_keks"
require "google/compute/property/imagefamilyview_image_source_snapshot_encryption_key_pk"
module GoogleInSpec
  module Compute
    module Property
      class ImageFamilyViewImageSourceSnapshotEncryptionKey
        attr_reader :pk

        attr_reader :keks

        attr_reader :dbs

        attr_reader :dbxs

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @pk = GoogleInSpec::Compute::Property::ImageFamilyViewImageSourceSnapshotEncryptionKeyPk.new(args["pk"], to_s)
          @keks = GoogleInSpec::Compute::Property::ImageFamilyViewImageSourceSnapshotEncryptionKeyKeksArray.parse(args["keks"], to_s)
          @dbs = GoogleInSpec::Compute::Property::ImageFamilyViewImageSourceSnapshotEncryptionKeyDbsArray.parse(args["dbs"], to_s)
          @dbxs = GoogleInSpec::Compute::Property::ImageFamilyViewImageSourceSnapshotEncryptionKeyDbxsArray.parse(args["dbxs"], to_s)
        end

        def to_s
          "#{@parent_identifier} ImageFamilyViewImageSourceSnapshotEncryptionKey"
        end
      end
    end
  end
end
