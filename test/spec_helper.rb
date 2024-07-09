# # spec/spec_helper.rb
# require 'rspec'
# require 'webmock/rspec'
#
# RSpec.configure do |config|
#   config.before(:each) do
#     # Example response for stubbing a Google Compute Instance API request
#     compute_instance_response = {
#       canIpForward: false,
#       cpuPlatform: 'Intel Broadwell',
#       creationTimestamp: '2023-01-01T12:00:00.000-07:00',
#       deletionProtection: false,
#       disks: [],
#       guestAccelerators: [],
#       hostname: 'mock-hostname',
#       id: '1234567890',
#       labelFingerprint: 'mock-fingerprint',
#       labels: {},
#       metadata: {},
#       machineType: 'n1-standard-1',
#       minCpuPlatform: 'Intel Broadwell',
#       name: 'mock_instance_name',
#       networkInterfaces: [],
#       scheduling: {},
#       serviceAccounts: [],
#       shieldedInstanceConfig: {},
#       status: 'RUNNING',
#       statusMessage: 'Instance running',
#       tags: {},
#       zone: 'projects/mock_project/zones/mock_zone'
#     }
#
#     # Stubbing the Google Compute Instance API request
#     stub_request(:get, "https://compute.googleapis.com/compute/v1/projects/mock_project/zones/mock_zone/instances/mock_instance_name")
#       .to_return(status: 200, body: compute_instance_response.to_json, headers: { 'Content-Type' => 'application/json' })
#
#     # Add other global stubs here if needed
#   end
#
#   # Enable flags like --only-failures and --next-failure
#   config.example_status_persistence_file_path = "spec/examples.txt"
#
#   # Disable RSpec exposing methods globally on `Module` and `main`
#   config.disable_monkey_patching!
#
#   config.expect_with :rspec do |c|
#     c.syntax = :expect
#   end
#
#   # Enable WebMock
#   WebMock.disable_net_connect!(allow_localhost: true)
# end
