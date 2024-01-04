

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
  module Container
    module Property
      class ClusterMasterAuthClientCertificateConfig
        attr_reader :issue_client_certificate

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @issue_client_certificate = args["issueClientCertificate"]
        end

        def to_s
          "#{@parent_identifier} ClusterMasterAuthClientCertificateConfig"
        end
      end
    end
  end
end
