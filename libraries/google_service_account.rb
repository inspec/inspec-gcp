# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleServiceAccount < GcpResourceBase
    name 'google_service_account'
    desc 'Verifies settings for a project IAM Service Account'

    example "
      describe google_service_account('my-project-id') do
        it { should exist }
        its('stage') { should eq 'GA' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        # here we have to retrieve the list of service accounts for the project in order to obtain either
        # the unique_id or email of the created service account, this allows us to retrieve it directly
        service_accounts = @gcp.gcp_iam_client.list_project_service_accounts("projects/#{opts[:project]}")
        service_accounts.accounts.each do |account|
          if @display_name == account.display_name
            @service_account = @gcp.gcp_iam_client.get_project_service_account("projects/#{opts[:project]}/serviceAccounts/#{account.unique_id}")
          end
        end
        create_resource_methods(@service_account)
      end
    end

    def exists?
      !@iam_role.nil?
    end

    def to_s
      "IAM Service Account #{@display_name}"
    end
  end
end
