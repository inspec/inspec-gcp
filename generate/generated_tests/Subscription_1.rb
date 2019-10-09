title 'Test GCP Subscription resource.'

control 'Subscription_1' do
  impact 1.0
  title 'Subscription resource test'

  describe google_pubsub_subscription({:project=>"graphite-test-sam-chef", :name=>"gcr-analysis-b819f10651cde17eadb3931f9505f500"}) do
    it { should exist }

    its('name') { should cmp "gcr-analysis-b819f10651cde17eadb3931f9505f500" }
    its('topic') { should cmp "projects/graphite-test-sam-chef/topics/gcr" }
    its('push_config.push_endpoint') { should cmp "rpc://blade:asia-vulnz-workflow-prod" }
    its('ack_deadline_seconds') { should cmp 10 }
    its('message_retention_duration') { should cmp "604800s" }
    its('expiration_policy.ttl') { should cmp "2678400s" }
  end
end