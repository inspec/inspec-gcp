

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
require "google/kms/property/ekmconnection_service_resolvers_server_certificates"
module GoogleInSpec
  module KMS
    module Property
      class EkmConnectionServiceResolvers
        attr_reader :service_directory_service

        attr_reader :endpoint_filter

        attr_reader :hostname

        attr_reader :server_certificates

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @service_directory_service = args["serviceDirectoryService"]
          @endpoint_filter = args["endpointFilter"]
          @hostname = args["hostname"]
          @server_certificates = GoogleInSpec::KMS::Property::EkmConnectionServiceResolversServerCertificates.new(args["serverCertificates"], to_s)
        end

        def to_s
          "#{@parent_identifier} EkmConnectionServiceResolvers"
        end
      end
    end
  end
end
