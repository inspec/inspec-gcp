# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleKMSKeyRingIAMBinding < GcpResourceBase
    name 'google_kms_key_ring_iam_binding'
    desc 'Verifies settings for a single KMS Key Ring IAM binding'

    example "
      describe google_kms_key_ring_iam_binding(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring', role: 'roles/compute.admin') do
        it { should exist }
        its('members') {should include 'user:someuser@domain.com' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @key_ring_url = opts[:key_ring_url]
      @role = opts[:role]
      @iam_binding_exists = false
      @members_list=[]
      catch_gcp_errors do
        # NOTE: this is the same call as for the plural iam_bindings resource because there isn't an easy way to pull out a singular binding
        @iam_bindings = @gcp.gcp_client(Google::Apis::CloudkmsV1::CloudKMSService).get_project_location_key_ring_iam_policy(@key_ring_url)
        raise Inspec::Exceptions::ResourceFailed, "google_kms_key_ring_iam_binding is missing expected IAM policy 'bindings' property" if !@iam_bindings || !@iam_bindings.bindings
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
      "Key Ring IAM Binding #{@role}"
    end
  end
end
