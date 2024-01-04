

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
require "google/vertexai/property/pipelinejob_job_detail_task_details_execution_labels"
require "google/vertexai/property/pipelinejob_job_detail_task_details_execution_metadata"
module GoogleInSpec
  module VertexAI
    module Property
      class PipelineJobJobDetailTaskDetailsExecution
        attr_reader :labels

        attr_reader :create_time

        attr_reader :schema_version

        attr_reader :state

        attr_reader :name

        attr_reader :etag

        attr_reader :display_name

        attr_reader :metadata

        attr_reader :schema_title

        attr_reader :description

        attr_reader :update_time

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @labels = GoogleInSpec::VertexAI::Property::PipelineJobJobDetailTaskDetailsExecutionLabels.new(args["labels"], to_s)
          @create_time = args["createTime"]
          @schema_version = args["schemaVersion"]
          @state = args["state"]
          @name = args["name"]
          @etag = args["etag"]
          @display_name = args["displayName"]
          @metadata = GoogleInSpec::VertexAI::Property::PipelineJobJobDetailTaskDetailsExecutionMetadata.new(args["metadata"], to_s)
          @schema_title = args["schemaTitle"]
          @description = args["description"]
          @update_time = args["updateTime"]
        end

        def to_s
          "#{@parent_identifier} PipelineJobJobDetailTaskDetailsExecution"
        end
      end
    end
  end
end
