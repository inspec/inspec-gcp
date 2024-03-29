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
require 'google/vertexai/property/batchpredictionjob_output_config_bigquery_destination'
require 'google/vertexai/property/batchpredictionjob_output_config_gcs_destination'
module GoogleInSpec
  module VertexAI
    module Property
      class BatchPredictionJobOutputConfig
        attr_reader :gcs_destination

        attr_reader :predictions_format

        attr_reader :bigquery_destination

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @gcs_destination = GoogleInSpec::VertexAI::Property::BatchPredictionJobOutputConfigGcsDestination.new(args['gcsDestination'], to_s)
          @predictions_format = args['predictionsFormat']
          @bigquery_destination = GoogleInSpec::VertexAI::Property::BatchPredictionJobOutputConfigBigqueryDestination.new(args['bigqueryDestination'], to_s)
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobOutputConfig"
        end
      end
    end
  end
end
