# frozen_string_literal: false

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectAlertPolicyCondition < GcpResourceBase
    name 'google_project_alert_policy_condition'
    desc 'Verifies settings for a single GCP project alert policy condition by policy name and filter name'

    example "
      describe google_project_alert_policy_condition(policy: 'projects/my-project/alertPolicies/9271751234503117449', filter 'project=\"my-project\"') do
        it { should exist }
      end
    "

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @filter = params[:filter]
      @policy = params[:name]
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
      @condition = condition_for_filter(@filter)
    end

    def exists?
      !@condition.nil?
    end

    def condition_for_filter(filter)
      @policy_result = GoogleInSpec::Monitoring::Property::AlertPolicyConditionsArray.parse(@fetched['conditions'],to_s)
      return nil if !defined?(@policy_result) || @policy_result.nil?
      @policy_result.each do |condition|
        next if !defined?(condition.condition_threshold.filter) || condition.condition_threshold.filter.nil?
        return condition if condition.condition_threshold.filter == filter
      end
      nil
    end

    def condition_threshold_value
      return false if !defined?(@condition.condition_threshold.threshold_value) || @condition.condition_threshold.threshold_value.nil?
      @condition.condition_threshold.threshold_value
    end

    def aggregation_alignment_period
      return false if !defined?(@condition.condition_threshold.aggregations[0].alignment_period) || @condition.condition_threshold.aggregations[0].alignment_period.nil?
      @condition.condition_threshold.aggregations[0].alignment_period
    end

    def aggregation_per_series_aligner
      return false if !defined?(@condition.condition_threshold.aggregations[0].per_series_aligner) || @condition.condition_threshold.aggregations[0].per_series_aligner.nil?
      @condition.condition_threshold.aggregations[0].per_series_aligner
    end

    def aggregation_cross_series_reducer
      return false if !defined?(@condition.condition_threshold.aggregations[0].cross_series_reducer) || @condition.condition_threshold.aggregations[0].cross_series_reducer.nil?
      @condition.condition_threshold.aggregations[0].cross_series_reducer
    end

    def to_s
      "Alert Policy Condition #{@policy} \"#{@filter}\""
    end
    private

    def product_url(_ = nil)
      'https://monitoring.googleapis.com/v3/'
    end

    def resource_base_url
      '{{name}}'
    end
  end
end
