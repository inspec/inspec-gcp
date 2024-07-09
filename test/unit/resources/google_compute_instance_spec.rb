# test/unit/resources/google_compute_instance_spec.rb
# test/unit/resources/google_compute_instance_spec.rb

require_relative '../../../libraries/google_compute_instance'

describe GCPComputeInstance do
  before do
    stub_request(:get, "https://compute.googleapis.com/compute/v1/projects/mock_project/zones/mock_zone/instances/mock_instance_name")
      .to_return(body: {
        canIpForward: false,
        cpuPlatform: 'Intel Broadwell',
        creationTimestamp: '2023-01-01T12:00:00.000-07:00',
        deletionProtection: false,
        disks: [],
        guestAccelerators: [],
        hostname: 'mock-hostname',
        id: '1234567890',
        labelFingerprint: 'mock-fingerprint',
        labels: {},
        metadata: {},
        machineType: 'n1-standard-1',
        minCpuPlatform: 'Intel Broadwell',
        name: 'mock_instance_name',
        networkInterfaces: [],
        scheduling: {},
        serviceAccounts: [],
        shieldedInstanceConfig: {},
        status: 'RUNNING',
        statusMessage: 'Instance running',
        tags: {},
        zone: 'projects/mock_project/zones/mock_zone'
      }.to_json, headers: { 'Content-Type' => 'application/json' })
  end

  let(:params) { { name: 'mock_instance_name', zone: 'mock_zone', project: 'mock_project' } }
  let(:resource) { ComputeInstance.new(params) }

  it 'exists? method returns true' do
    expect(resource.exists?).to eq(true)
  end

  it 'parses instance properties correctly' do
    expect(resource.name).to eq('mock_instance_name')
    expect(resource.zone).to eq('projects/mock_project/zones/mock_zone')
    expect(resource.machine_type).to eq('n1-standard-1')
    expect(resource.status).to eq('RUNNING')
    expect(resource.hostname).to eq('mock-hostname')
  end

end

