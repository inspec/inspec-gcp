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
  module Dataproc
    module Property
      class BatchEnvironmentConfigExecutionConfig
        attr_reader :service_account

        attr_reader :network_uri

        attr_reader :subnetwork_uri

        attr_reader :network_tags

        attr_reader :kms_key

        attr_reader :idle_ttl

        attr_reader :ttl

        attr_reader :staging_bucket

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @service_account = args['serviceAccount']
          @network_uri = args['networkUri']
          @subnetwork_uri = args['subnetworkUri']
          @network_tags = args['networkTags']
          @kms_key = args['kmsKey']
          @idle_ttl = args['idleTtl']
          @ttl = args['ttl']
          @staging_bucket = args['stagingBucket']
        end

        def to_s
          "#{@parent_identifier} BatchEnvironmentConfigExecutionConfig"
        end
      end
    end
  end
end
