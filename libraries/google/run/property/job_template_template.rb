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
require 'google/run/property/job_template_template_containers'
require 'google/run/property/job_template_template_volumes'
require 'google/run/property/job_template_template_vpc_access'
require 'google/run/property/job_template_template_vpc_access_network_interfaces'
module GoogleInSpec
  module Run
    module Property
      class JobTemplateTemplate
        attr_reader :containers

        attr_reader :volumes

        attr_reader :max_retries

        attr_reader :timeout

        attr_reader :service_account

        attr_reader :execution_environment

        attr_reader :encryption_key

        attr_reader :vpc_access

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @containers = GoogleInSpec::Run::Property::JobTemplateTemplateContainersArray.parse(args['containers'], to_s)
          @volumes = GoogleInSpec::Run::Property::JobTemplateTemplateVolumesArray.parse(args['volumes'], to_s)
          @max_retries = args['maxRetries']
          @timeout = args['timeout']
          @service_account = args['serviceAccount']
          @execution_environment = args['executionEnvironment']
          @encryption_key = args['encryptionKey']
          @vpc_access = GoogleInSpec::Run::Property::JobTemplateTemplateVPCAccess.new(args['vpcAccess'], to_s)
        end

        def to_s
          "#{@parent_identifier} JobTemplateTemplate"
        end
      end
    end
  end
end