# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleServiceAccounts < GcpResourceBase
    name 'google_service_accounts'
    desc 'Verifies settings for GCP compute service accounts in bulk'

    example "
      describe google_service_accounts(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:service_account_ids, field: :service_account_id)
    filter_table_config.add(:service_account_names, field: :service_account_name)
    filter_table_config.add(:service_account_display_names, field: :service_account_display_name)
    filter_table_config.add(:service_account_emails, field: :service_account_email)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      service_account_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @service_accounts = @gcp.gcp_iam_client.list_project_service_accounts("projects/#{@project}", page_token: next_page)
        end
        return [] if !@service_accounts || !@service_accounts.accounts
        @service_accounts.accounts.map do |service_account|
          service_account_rows+=[{ service_account_id: service_account.unique_id,
                                   service_account_name: service_account.name,
                                   service_account_display_name: service_account.display_name,
                                   service_account_email: service_account.email }]
        end
        next_page = @service_accounts.next_page_token
        break unless next_page
      end
      @table = service_account_rows
    end
  end
end
