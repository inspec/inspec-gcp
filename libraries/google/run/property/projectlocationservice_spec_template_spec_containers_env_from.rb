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
require 'google/run/property/projectlocationservice_spec_template_spec_containers_env_from_config_map_ref'
require 'google/run/property/projectlocationservice_spec_template_spec_containers_env_from_config_map_ref_local_object_reference'
require 'google/run/property/projectlocationservice_spec_template_spec_containers_env_from_secret_ref'
require 'google/run/property/projectlocationservice_spec_template_spec_containers_env_from_secret_ref_local_object_reference'
module GoogleInSpec
  module Run
    module Property
      class ProjectLocationServiceSpecTemplateSpecContainersEnvFrom
        attr_reader :prefix

        attr_reader :config_map_ref

        attr_reader :secret_ref

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @prefix = args['prefix']
          @config_map_ref = GoogleInSpec::Run::Property::ProjectLocationServiceSpecTemplateSpecContainersEnvFromConfigMapRef.new(args['configMapRef'], to_s)
          @secret_ref = GoogleInSpec::Run::Property::ProjectLocationServiceSpecTemplateSpecContainersEnvFromSecretRef.new(args['secretRef'], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationServiceSpecTemplateSpecContainersEnvFrom"
        end
      end

      class ProjectLocationServiceSpecTemplateSpecContainersEnvFromArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationServiceSpecTemplateSpecContainersEnvFrom.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationServiceSpecTemplateSpecContainersEnvFrom.new(v, parent_identifier) }
        end
      end
    end
  end
end
