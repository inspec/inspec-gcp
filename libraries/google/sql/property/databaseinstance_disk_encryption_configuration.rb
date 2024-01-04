

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
module GoogleInSpec
  module SQL
    module Property
      class DatabaseInstanceDiskEncryptionConfiguration
        attr_reader :kms_key_name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @kms_key_name = args["kmsKeyName"]
        end

        def to_s
          "#{@parent_identifier} DatabaseInstanceDiskEncryptionConfiguration"
        end
      end
    end
  end
end
