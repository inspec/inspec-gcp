# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeProjects < GcpResourceBase
    name 'google_projects'
    desc 'Verifies settings for GCP compute projects in bulk'

    example "
      describe google_projects do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:project_ids, field: :project_id)
    filter_table_config.add(:project_names, field: :project_name)
    filter_table_config.add(:project_numbers, field: :project_number)
    filter_table_config.add(:lifecycle_state, field: :lifecycle_state)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      project_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @projects = @gcp.gcp_project_client.list_projects(page_token: next_page)
        end
        return [] if !@projects || !@projects.projects
        @projects.projects.map do |project|
          project_rows += [{ project_id: project.project_id,
                            project_name: project.name,
                            project_number: project.project_number,
                            lifecycle_state: project.lifecycle_state }]
        end
        next_page = @projects.next_page_token
        break unless next_page
      end
      @table = project_rows
    end
  end
end
