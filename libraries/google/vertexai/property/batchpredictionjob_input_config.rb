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
require 'google/vertexai/property/batchpredictionjob_input_config_bigquery_source'
require 'google/vertexai/property/batchpredictionjob_input_config_gcs_source'
module GoogleInSpec
  module VertexAI
    module Property
      class BatchPredictionJobInputConfig
        attr_reader :instances_format

        attr_reader :bigquery_source

        attr_reader :gcs_source

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @instances_format = args['instancesFormat']
          @bigquery_source = GoogleInSpec::VertexAI::Property::BatchPredictionJobInputConfigBigquerySource.new(args['bigquerySource'], to_s)
          @gcs_source = GoogleInSpec::VertexAI::Property::BatchPredictionJobInputConfigGcsSource.new(args['gcsSource'], to_s)
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobInputConfig"
        end
      end
    end
  end
end
