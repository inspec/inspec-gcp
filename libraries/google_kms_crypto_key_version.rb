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
require 'gcp_backend'
require 'google/kms/property/cryptokeyversion_attestation'
require 'google/kms/property/cryptokeyversion_external_protection_level_options'

# A provider to manage Cloud Key Management Service resources.
class KMSCryptoKeyVersion < GcpResourceBase
  name 'google_kms_crypto_key_version'
  desc 'CryptoKeyVersion'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :create_time
  attr_reader :generate_time
  attr_reader :destroy_time
  attr_reader :destroy_event_time
  attr_reader :state
  attr_reader :protection_level
  attr_reader :algorithm
  attr_reader :attestation
  attr_reader :import_job
  attr_reader :import_time
  attr_reader :import_failure_reason
  attr_reader :external_protection_level_options
  attr_reader :reimport_eligible
  attr_reader :key_ring
  attr_reader :crypto_key

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @create_time = parse_time_string(@fetched['createTime'])
    @generate_time = parse_time_string(@fetched['generateTime'])
    @destroy_time = parse_time_string(@fetched['destroyTime'])
    @destroy_event_time = parse_time_string(@fetched['destroyEventTime'])
    @state = @fetched['state']
    @protection_level = @fetched['protectionLevel']
    @algorithm = @fetched['algorithm']
    @attestation = GoogleInSpec::KMS::Property::CryptoKeyVersionAttestation.new(@fetched['attestation'], to_s)
    @import_job = @fetched['importJob']
    @import_time = parse_time_string(@fetched['importTime'])
    @import_failure_reason = @fetched['importFailureReason']
    @external_protection_level_options = GoogleInSpec::KMS::Property::CryptoKeyVersionExternalProtectionLevelOptions.new(@fetched['externalProtectionLevelOptions'], to_s)
    @reimport_eligible = @fetched['reimportEligible']
    @key_ring = @fetched['keyRing']
    @crypto_key = @fetched['cryptoKey']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "CryptoKeyVersion #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://cloudkms.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}/cryptoKeyVersions/{{name}}'
  end
end