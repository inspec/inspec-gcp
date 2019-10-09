# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeOrganizations < GcpResourceBase
    name 'google_organizations'
    desc 'Verifies settings for GCP organizations in bulk'

    example "
      describe google_organizations do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      super(opts)
    end

    filter_table_config = FilterTable.create
    filter_table_config.add(:names, field: :name)
    filter_table_config.add(:display_names, field: :display_name)
    filter_table_config.add(:lifecycle_state, field: :lifecycle_state)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      organizations_rows = []
      loop do
        catch_gcp_errors do
          @organizations = @gcp.gcp_project_client.search_organizations({})
        end
        return [] if !@organizations || !@organizations.organizations
        @organizations.organizations.map do |organization|
          organizations_rows += [{ name: organization.name,
                                  display_name: organization.display_name,
                                  lifecycle_state: organization.lifecycle_state }]
        end
        next_page = @organizations.next_page_token
        break unless next_page
      end
      @table = organizations_rows
    end
  end
end
