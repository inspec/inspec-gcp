

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
require "google/storage/property/bucket_default_object_acl_project_team"
module GoogleInSpec
  module Storage
    module Property
      class BucketDefaultObjectAcl
        attr_reader :bucket

        attr_reader :domain

        attr_reader :email

        attr_reader :entity

        attr_reader :entity_id

        attr_reader :generation

        attr_reader :id

        attr_reader :object

        attr_reader :project_team

        attr_reader :role

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @bucket = args["bucket"]
          @domain = args["domain"]
          @email = args["email"]
          @entity = args["entity"]
          @entity_id = args["entityId"]
          @generation = args["generation"]
          @id = args["id"]
          @object = args["object"]
          @project_team = GoogleInSpec::Storage::Property::BucketDefaultObjectAclProjectTeam.new(args["projectTeam"], to_s)
          @role = args["role"]
        end

        def to_s
          "#{@parent_identifier} BucketDefaultObjectAcl"
        end
      end

      class BucketDefaultObjectAclArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return BucketDefaultObjectAcl.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| BucketDefaultObjectAcl.new(v, parent_identifier) }
        end
      end
    end
  end
end
