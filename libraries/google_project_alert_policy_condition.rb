# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/monitoring_v3'

module Inspec::Resources
  class GoogleProjectAlertPolicyCondition < GcpResourceBase
    name 'google_project_alert_policy_condition'
    desc 'Verifies settings for a single GCP project alert policy condition by policy name and filter name'

    example "
      describe google_project_alert_policy_condition(policy: 'projects/my-project/alertPolicies/9271751234503117449', filter 'project=\"my-project\"') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @filter = opts[:filter]
      @policy = opts[:policy]
      catch_gcp_errors do
        @policy_result = @gcp.gcp_client(Google::Apis::MonitoringV3::MonitoringService).get_project_alert_policy(@policy)
        @condition = condition_for_filter(@filter)
      end
    end

    def exists?
      !@condition.nil?
    end

    def condition_for_filter(filter)
      return nil if !defined?(@policy_result.conditions)
      @policy_result.conditions.each do |condition|
        next if !defined?(condition.condition_threshold.filter)
        return condition if condition.condition_threshold.filter == filter
      end
      nil
    end

    def condition_threshold_value
      return false if !defined?(@condition.condition_threshold.threshold_value)
      @condition.condition_threshold.threshold_value
    end

    def aggregation_alignment_period
      return false if !defined?(@condition.condition_threshold.aggregations[0].alignment_period)
      @condition.condition_threshold.aggregations[0].alignment_period
    end

    def aggregation_per_series_aligner
      return false if !defined?(@condition.condition_threshold.aggregations[0].per_series_aligner)
      @condition.condition_threshold.aggregations[0].per_series_aligner
    end

    def aggregation_cross_series_reducer
      return false if !defined?(@condition.condition_threshold.aggregations[0].cross_series_reducer)
      @condition.condition_threshold.aggregations[0].cross_series_reducer
    end

    def to_s
      "Alert Policy Condition #{@policy} \"#{@filter}\""
    end
  end
end
