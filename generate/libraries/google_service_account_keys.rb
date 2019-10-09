# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleServiceAccountKeys < GcpResourceBase
    name 'google_service_account_keys'
    desc 'Verifies settings for GCP service account keys in bulk'

    example "
      describe google_service_account_keys(service_account: 'projects/sample-project/serviceAccounts/sample-account@sample-project.iam.gserviceaccount.com') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @service_account = opts[:service_account]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:key_names, field: :key_name)
    filter_table_config.add(:valid_after_times, field: :valid_after_time)
    filter_table_config.add(:valid_before_times, field: :valid_before_time)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      account_key_rows = []
      catch_gcp_errors do
        # no pagination in the service API
        @service_account_keys = @gcp.gcp_iam_client.list_project_service_account_keys(@service_account)
      end
      return [] if !@service_account_keys || !@service_account_keys.keys
      @service_account_keys.keys.map do |sa_key|
        account_key_rows+=[{ key_name: sa_key.name,
                             valid_after_time: Time.parse(sa_key.valid_after_time),
                             valid_before_time: Time.parse(sa_key.valid_before_time) }]
      end
      @table = account_key_rows
    end
  end
end
