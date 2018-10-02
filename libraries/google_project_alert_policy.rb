# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/monitoring_v3'

module Inspec::Resources
  class GoogleProjectAlertPolicy < GcpResourceBase
    name 'google_project_alert_policy'
    desc 'Verifies settings for a single GCP project alert policy'

    example "
      describe google_project_alert_policy(policy: 'projects/spaterson-project/alertPolicies/9271751234503117449') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:policy]
      catch_gcp_errors do
        @policy = @gcp.gcp_client(Google::Apis::MonitoringV3::MonitoringService).get_project_alert_policy(opts[:policy])
        create_resource_methods(@policy)
      end
    end

    def enabled?
      return false if !defined?(@policy.enabled)
      @policy.enabled
    end

    def exists?
      !@policy.nil?
    end

    def to_s
      "Alert Policy #{@display_name}"
    end
  end
end
