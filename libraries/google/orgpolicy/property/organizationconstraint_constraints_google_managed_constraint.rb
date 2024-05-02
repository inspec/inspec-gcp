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
  module Orgpolicy
    module Property
      class OrganizationConstraintConstraintsGoogleManagedConstraint
        attr_reader :action_type

        attr_reader :resource_types

        attr_reader :condition

        attr_reader :method_types

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @action_type = args['actionType']
          @resource_types = args['resourceTypes']
          @condition = args['condition']
          @method_types = args['methodTypes']
        end

        def to_s
          "#{@parent_identifier} OrganizationConstraintConstraintsGoogleManagedConstraint"
        end
      end
    end
  end
end
