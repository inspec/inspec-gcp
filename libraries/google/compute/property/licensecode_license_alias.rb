

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
  module Compute
    module Property
      class LicenseCodeLicenseAlias
        attr_reader :self_link

        attr_reader :description

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @self_link = args["selfLink"]
          @description = args["description"]
        end

        def to_s
          "#{@parent_identifier} LicenseCodeLicenseAlias"
        end
      end

      class LicenseCodeLicenseAliasArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return LicenseCodeLicenseAlias.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| LicenseCodeLicenseAlias.new(v, parent_identifier) }
        end
      end
    end
  end
end
