# frozen_string_literal: false

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
require 'google/cloudbuild/property/trigger_build_options_volumes'
module GoogleInSpec
  module CloudBuild
    module Property
      class TriggerBuildOptions
        attr_reader :source_provenance_hash, :requested_verify_option, :machine_type, :disk_size_gb, :substitution_option, :dynamic_substitutions, :log_streaming_option, :worker_pool, :logging, :env, :secret_env, :volumes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @source_provenance_hash = args['sourceProvenanceHash']
          @requested_verify_option = args['requestedVerifyOption']
          @machine_type = args['machineType']
          @disk_size_gb = args['diskSizeGb']
          @substitution_option = args['substitutionOption']
          @dynamic_substitutions = args['dynamicSubstitutions']
          @log_streaming_option = args['logStreamingOption']
          @worker_pool = args['workerPool']
          @logging = args['logging']
          @env = args['env']
          @secret_env = args['secretEnv']
          @volumes = GoogleInSpec::CloudBuild::Property::TriggerBuildOptionsVolumesArray.parse(args['volumes'], to_s)
        end

        def to_s
          "#{@parent_identifier} TriggerBuildOptions"
        end
      end
    end
  end
end
