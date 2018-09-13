# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/monitoring_v3'

module Inspec::Resources
  class GoogleProjectAlertPolicies < GcpResourceBase
    name 'google_project_alert_policies'
    desc 'Verifies settings for GCP project alert policies in bulk'

    example "
      describe google_project_alert_policies(project: 'chef-inspec-gcp') do
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
    filter_table_config.add(:policy_names, field: :policy_name)
    filter_table_config.add(:policy_display_names, field: :policy_display_name)
    filter_table_config.add(:policy_enabled_states, field: :policy_enabled_state)
    filter_table_config.add(:policy_filter_lists, field: :policy_filter_list)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      policy_rows = []
      catch_gcp_errors do
        @policies = @gcp.gcp_client(Google::Apis::MonitoringV3::MonitoringService).list_project_alert_policies("projects/#{@project}")
      end
      return [] if !@policies || !@policies.alert_policies
      @policies.alert_policies.map do |policy|
        policy_filters = []
        policy.conditions.each do |condition|
          next if !defined?(condition.condition_threshold.filter)
          policy_filters+=[condition.condition_threshold.filter]
        end

        policy_rows+=[{ policy_name: policy.name,
                        policy_display_name: policy.display_name,
                        policy_enabled_state: policy.enabled,
                        policy_filter_list: policy_filters }]
      end
      @table = policy_rows
    end
  end
end
