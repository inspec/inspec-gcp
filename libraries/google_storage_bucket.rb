

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
require "gcp_backend"
require "google/storage/property/bucket_acl"
require "google/storage/property/bucket_cors"
require "google/storage/property/bucket_default_object_acl"
require "google/storage/property/bucket_encryption"
require "google/storage/property/bucket_lifecycle"
require "google/storage/property/bucket_lifecycle_rule"
require "google/storage/property/bucket_logging"
require "google/storage/property/bucket_owner"
require "google/storage/property/bucket_retention_policy"
require "google/storage/property/bucket_versioning"
require "google/storage/property/bucket_website"

# A provider to manage Cloud Storage resources.
class StorageBucket < GcpResourceBase
  name "google_storage_bucket"
  desc "Bucket"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :acl
  attr_reader :cors
  attr_reader :default_event_based_hold
  attr_reader :default_object_acl
  attr_reader :id
  attr_reader :lifecycle
  attr_reader :location
  attr_reader :logging
  attr_reader :metageneration
  attr_reader :name
  attr_reader :owner
  attr_reader :project_number
  attr_reader :storage_class
  attr_reader :time_created
  attr_reader :updated
  attr_reader :versioning
  attr_reader :website
  attr_reader :labels
  attr_reader :encryption
  attr_reader :retention_policy
  attr_reader :project
  attr_reader :predefined_default_object_acl

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @acl = GoogleInSpec::Storage::Property::BucketAclArray.parse(@fetched["acl"], to_s)
    @cors = GoogleInSpec::Storage::Property::BucketCorsArray.parse(@fetched["cors"], to_s)
    @default_event_based_hold = @fetched["defaultEventBasedHold"]
    @default_object_acl = GoogleInSpec::Storage::Property::BucketDefaultObjectAclArray.parse(@fetched["defaultObjectAcl"], to_s)
    @id = @fetched["id"]
    @lifecycle = GoogleInSpec::Storage::Property::BucketLifecycle.new(@fetched["lifecycle"], to_s)
    @location = @fetched["location"]
    @logging = GoogleInSpec::Storage::Property::BucketLogging.new(@fetched["logging"], to_s)
    @metageneration = @fetched["metageneration"]
    @name = @fetched["name"]
    @owner = GoogleInSpec::Storage::Property::BucketOwner.new(@fetched["owner"], to_s)
    @project_number = @fetched["projectNumber"]
    @storage_class = @fetched["storageClass"]
    @time_created = parse_time_string(@fetched["timeCreated"])
    @updated = parse_time_string(@fetched["updated"])
    @versioning = GoogleInSpec::Storage::Property::BucketVersioning.new(@fetched["versioning"], to_s)
    @website = GoogleInSpec::Storage::Property::BucketWebsite.new(@fetched["website"], to_s)
    @labels = @fetched["labels"]
    @encryption = GoogleInSpec::Storage::Property::BucketEncryption.new(@fetched["encryption"], to_s)
    @retention_policy = GoogleInSpec::Storage::Property::BucketRetentionPolicy.new(@fetched["retentionPolicy"], to_s)
    @project = @fetched["project"]
    @predefined_default_object_acl = @fetched["predefinedDefaultObjectAcl"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Bucket #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://storage.googleapis.com/storage/v1/"
  end

  def resource_base_url
    "b/{{name}}?projection=full"
  end
end
