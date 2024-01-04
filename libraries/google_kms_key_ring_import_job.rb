

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
require "gcp_backend"
require "google/kms/property/keyringimportjob_attestation"
require "google/kms/property/keyringimportjob_public_key"

# A provider to manage Cloud Key Management Service resources.
class KMSKeyRingImportJob < GcpResourceBase
  name "google_kms_key_ring_import_job"
  desc "KeyRingImportJob"
  supports platform: "gcp"

  attr_reader :params
  attr_reader :name
  attr_reader :import_method
  attr_reader :protection_level
  attr_reader :create_time
  attr_reader :generate_time
  attr_reader :expire_time
  attr_reader :expire_event_time
  attr_reader :state
  attr_reader :public_key
  attr_reader :attestation
  attr_reader :key_ring
  attr_reader :import_job_id

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, "Get")
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched["name"]
    @import_method = @fetched["importMethod"]
    @protection_level = @fetched["protectionLevel"]
    @create_time = parse_time_string(@fetched["createTime"])
    @generate_time = parse_time_string(@fetched["generateTime"])
    @expire_time = parse_time_string(@fetched["expireTime"])
    @expire_event_time = parse_time_string(@fetched["expireEventTime"])
    @state = @fetched["state"]
    @public_key = GoogleInSpec::KMS::Property::KeyRingImportJobPublicKey.new(@fetched["publicKey"], to_s)
    @attestation = GoogleInSpec::KMS::Property::KeyRingImportJobAttestation.new(@fetched["attestation"], to_s)
    @key_ring = @fetched["keyRing"]
    @import_job_id = @fetched["importJobId"]
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "KeyRingImportJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    "https://cloudkms.googleapis.com/v1/"
  end

  def resource_base_url
    "{{name}}"
  end
end
