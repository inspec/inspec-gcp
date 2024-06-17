# libraries/mock_gcp.rb

require 'gcp_backend'

module GcpBackend
  class MockGcp < GcpBackend::Google
    def initialize
      @compute = Google::Apis::ComputeV1::ComputeService.new
    end

    def get_region_notification_endpoints(_project, _region)
      region_notification_endpoint = Google::Apis::ComputeV1::NotificationEndpoint.new(
        id: '1234567890',
        name: 'test-notification-endpoint',
        description: 'A test notification endpoint',
        creation_timestamp: '2021-01-01T00:00:00.000-00:00',
        self_link: 'https://www.googleapis.com/compute/v1/projects/my-project/regions/us-central1/notificationEndpoints/test-notification-endpoint'
      )

      region_notification_endpoints = Google::Apis::ComputeV1::NotificationEndpointList.new(
        items: [region_notification_endpoint]
      )

      region_notification_endpoints
    end
  end
end

