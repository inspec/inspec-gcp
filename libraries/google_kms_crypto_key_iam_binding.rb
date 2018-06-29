# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleKMSCryptoKeyIAMBinding < GcpResourceBase
    name 'google_kms_crypto_key_iam_binding'
    desc 'Verifies settings for a single KMS Crypto Key IAM binding'

    example "
      describe google_kms_crypto_key_iam_binding(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name',  role: 'roles/owner') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @crypto_key_url = opts[:crypto_key_url]
      @role = opts[:role]
      @iam_binding_exists = false
      @members_list=[]
      catch_gcp_errors do
        # note this is the same call as for the plural iam_bindings resource because there isn't an easy way to pull out a singular binding
        @iam_bindings = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).get_project_location_key_ring_crypto_key_iam_policy(@crypto_key_url)
        raise Inspec::Exceptions::ResourceFailed, "google_kms_crypto_key_iam_binding is missing expected IAM policy 'bindings' property" if !@iam_bindings || !@iam_bindings.bindings
        @iam_bindings.bindings.each do |binding|
          next if binding.role != @role
          @iam_binding_exists=true
          @members_list=binding.members
        end
      end
    end

    # return the list of users corresponding to the role
    def members
      @members_list
    end

    def exists?
      @iam_binding_exists
    end

    def to_s
      "Crypto Key IAM Binding #{@role}"
    end
  end
end
