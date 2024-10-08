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
require 'google/run/property/job_template_template_containers_liveness_probe_http_get_http_headers'
module GoogleInSpec
  module Run
    module Property
      class JobTemplateTemplateContainersLivenessProbeHttpGet
        attr_reader :path

        attr_reader :http_headers

        attr_reader :port

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @path = args['path']
          @http_headers = GoogleInSpec::Run::Property::JobTemplateTemplateContainersLivenessProbeHttpGetHttpHeadersArray.parse(args['httpHeaders'], to_s)
          @port = args['port']
        end

        def to_s
          "#{@parent_identifier} JobTemplateTemplateContainersLivenessProbeHttpGet"
        end
      end
    end
  end
end
