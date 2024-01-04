

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
require "google/dlp/property/jobtrigger_inspect_job_storage_config_cloud_storage_options_file_set"
require "google/dlp/property/jobtrigger_inspect_job_storage_config_cloud_storage_options_file_set_regex_file_set"
module GoogleInSpec
  module DLP
    module Property
      class JobTriggerInspectJobStorageConfigCloudStorageOptions
        attr_reader :file_set

        attr_reader :bytes_limit_per_file

        attr_reader :bytes_limit_per_file_percent

        attr_reader :files_limit_percent

        attr_reader :file_types

        attr_reader :sample_method

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @file_set = GoogleInSpec::DLP::Property::JobTriggerInspectJobStorageConfigCloudStorageOptionsFileSet.new(args["fileSet"], to_s)
          @bytes_limit_per_file = args["bytesLimitPerFile"]
          @bytes_limit_per_file_percent = args["bytesLimitPerFilePercent"]
          @files_limit_percent = args["filesLimitPercent"]
          @file_types = args["fileTypes"]
          @sample_method = args["sampleMethod"]
        end

        def to_s
          "#{@parent_identifier} JobTriggerInspectJobStorageConfigCloudStorageOptions"
        end
      end
    end
  end
end
