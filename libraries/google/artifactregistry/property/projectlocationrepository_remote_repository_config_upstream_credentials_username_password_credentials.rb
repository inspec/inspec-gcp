

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
  module Artifactregistry
    module Property
      class ProjectLocationRepositoryRemoteRepositoryConfigUpstreamCredentialsUsernamePasswordCredentials
        attr_reader :username

        attr_reader :password_secret_version

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @username = args["username"]
          @password_secret_version = args["passwordSecretVersion"]
        end

        def to_s
          "#{@parent_identifier} ProjectLocationRepositoryRemoteRepositoryConfigUpstreamCredentialsUsernamePasswordCredentials"
        end
      end
    end
  end
end
