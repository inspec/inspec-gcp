# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/admin_directory_v1'

module Inspec::Resources
  class GoogleUsers < GcpResourceBase
    name 'google_users'
    desc 'Verifies settings for GCP users in bulk'

    example "
      describe google_users(customer: 'my_customer') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @customer = opts[:customer] || 'my_customer'
      @domain = opts[:domain] || ''
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:user_ids, field: :user_id)
    filter_table_config.add(:user_full_names, field: :user_full_name)
    filter_table_config.add(:user_emails, field: :user_email)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      user_rows = []
      catch_gcp_errors do
        @users = @gcp.gcp_admin_client.list_users(customer: @customer,domain: @domain)
      end
      return [] if !@users || !@users.users
      @users.users.map do |user|
        user_rows+=[{ user_id: user.id,
                      user_name: user.name.full_name,
                      user_email: user.primary_email }]
      end
      @table = user_rows
    end
  end
end
