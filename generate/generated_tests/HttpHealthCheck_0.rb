title 'Test GCP HttpHealthCheck resource.'

control 'HttpHealthCheck_0' do
  impact 1.0
  title 'HttpHealthCheck resource test'

  describe google_compute_http_health_check({:project=>"graphite-test-sam-chef", :name=>"tf-test-wrl87o4ba3"}) do
    it { should exist }

    its('check_interval_sec') { should cmp 1 }
    its('creation_timestamp.to_s') { should cmp '2019-09-13 13:42:38 -0700' }
    its('description') { should cmp "" }
    its('healthy_threshold') { should cmp 2 }
    its('host') { should cmp "" }
    its('id') { should cmp "6853364670877024721" }
    its('name') { should cmp "tf-test-wrl87o4ba3" }
    its('port') { should cmp 80 }
    its('request_path') { should cmp "/" }
    its('timeout_sec') { should cmp 1 }
    its('unhealthy_threshold') { should cmp 2 }
  end
end