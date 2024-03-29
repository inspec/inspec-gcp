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
require 'google/artifactregistry/property/projectlocationrepository_remote_repository_config_yum_repository_public_repository'
module GoogleInSpec
  module Artifactregistry
    module Property
      class ProjectLocationRepositoryRemoteRepositoryConfigYumRepository
        attr_reader :public_repository

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @public_repository = GoogleInSpec::Artifactregistry::Property::ProjectLocationRepositoryRemoteRepositoryConfigYumRepositoryPublicRepository.new(args['publicRepository'], to_s)
        end

        def to_s
          "#{@parent_identifier} ProjectLocationRepositoryRemoteRepositoryConfigYumRepository"
        end
      end
    end
  end
end
