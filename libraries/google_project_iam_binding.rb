# frozen_string_literal: false

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectIAMBinding < GcpResourceBase
    name 'google_project_iam_binding'
    desc 'Verifies settings for a single GCP KMS key ring IAM bindings'

    example "
      describe google_kms_key_ring_iam_binding(key_ring_url: 'projects/project/locations/europe-west2/keyRings/key-ring', role: 'roles/compute.admin') do
        it { should exist }
      end
    "
    attr_reader :params

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @project = params[:project]
      @params = params
      @role = params[:role]
      @iam_binding_exists = false
      @members_list=[]
      # NOTE: this is the same call as for the plural iam_bindings resource because there isn't an easy way to pull out a singular binding
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Post')
      @bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)
      raise Inspec::Exceptions::ResourceFailed, "google_project_iam_binding is missing expected IAM policy 'bindings' property" if !@bindings
      @bindings.each do |binding|
        next if binding.role != @role.to_s
        @iam_binding_exists=true
        @members_list=binding.members
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
      "Project IAM Binding #{@role}"
    end

    private

    def product_url
      'https://cloudresourcemanager.googleapis.com/v1/'
    end

    def resource_base_url
      'projects/{{project}}:getIamPolicy'
    end
  end
end
