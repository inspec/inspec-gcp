

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
module GoogleInSpec
  module Container
    module Property
      class NodePoolConfigAccelerators
        attr_reader :accelerator_count

        attr_reader :accelerator_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @accelerator_count = args["acceleratorCount"]
          @accelerator_type = args["acceleratorType"]
        end

        def to_s
          "#{@parent_identifier} NodePoolConfigAccelerators"
        end
      end

      class NodePoolConfigAcceleratorsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return NodePoolConfigAccelerators.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| NodePoolConfigAccelerators.new(v, parent_identifier) }
        end
      end
    end
  end
end
