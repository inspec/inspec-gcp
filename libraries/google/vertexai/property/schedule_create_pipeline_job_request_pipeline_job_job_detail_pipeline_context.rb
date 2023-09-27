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
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_labels'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_metadata'
module GoogleInSpec
  module VertexAI
    module Property
      class ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineContext
        attr_reader :name

        attr_reader :schema_title

        attr_reader :etag

        attr_reader :description

        attr_reader :display_name

        attr_reader :schema_version

        attr_reader :create_time

        attr_reader :labels

        attr_reader :metadata

        attr_reader :update_time

        attr_reader :parent_contexts

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @schema_title = args['schemaTitle']
          @etag = args['etag']
          @description = args['description']
          @display_name = args['displayName']
          @schema_version = args['schemaVersion']
          @create_time = args['createTime']
          @labels = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineContextLabels.new(args['labels'], to_s)
          @metadata = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineContextMetadata.new(args['metadata'], to_s)
          @update_time = args['updateTime']
          @parent_contexts = args['parentContexts']
        end

        def to_s
          "#{@parent_identifier} ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineContext"
        end
      end
    end
  end
end
