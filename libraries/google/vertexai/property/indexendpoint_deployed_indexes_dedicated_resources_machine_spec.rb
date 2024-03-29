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
module GoogleInSpec
  module VertexAI
    module Property
      class IndexEndpointDeployedIndexesDedicatedResourcesMachineSpec
        attr_reader :accelerator_type

        attr_reader :machine_type

        attr_reader :accelerator_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @accelerator_type = args['acceleratorType']
          @machine_type = args['machineType']
          @accelerator_count = args['acceleratorCount']
        end

        def to_s
          "#{@parent_identifier} IndexEndpointDeployedIndexesDedicatedResourcesMachineSpec"
        end
      end
    end
  end
end
