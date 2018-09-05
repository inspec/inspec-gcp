# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleServiceAccount < GcpResourceBase
    name 'google_service_account'
    desc 'Verifies settings for a project IAM Service Account'

    example "
      describe google_service_account(name: 'projects/spaterson-project/serviceAccounts/sample-account@spaterson-project.iam.gserviceaccount.com') do
        it { should exist }
        its('stage') { should eq 'GA' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      catch_gcp_errors do
        @service_account = @gcp.gcp_iam_client.get_project_service_account(opts[:name])
        create_resource_methods(@service_account)
        @display_name = @service_account.unique_id
        @display_name = @service_account.display_name if @service_account.display_name
      end
    end

    def exists?
      !@service_account.nil?
    end

    # Note this is done at the service account level not the individual key level because this metadata is not
    # returned by default when listing keys.
    def user_managed_keys
      raise Inspec::Exceptions::ResourceFailed, "Service Account #{@display_name} does not exist!" if not exists?
      @gcp.gcp_iam_client.list_project_service_account_keys(@service_account.name, key_types: ['USER_MANAGED'])
    end

    def has_user_managed_keys?
      return false if !user_managed_keys.keys
      true
    end

    def to_s
      "Service Account \"#{@display_name}\""
    end
  end
end
