title 'Test GCP Subscription resource.'

control 'Subscription_0' do
  impact 1.0
  title 'Subscription resource test'

  describe google_pubsub_subscription({:project=>"graphite-test-sam-chef", :name=>"gcr-analysis-67676ffa17551656f52b0d4f914c3387"}) do
    it { should exist }

    its('name') { should cmp "gcr-analysis-67676ffa17551656f52b0d4f914c3387" }
    its('topic') { should cmp "projects/graphite-test-sam-chef/topics/gcr" }
    its('push_config.push_endpoint') { should cmp "rpc://blade:eu-vulnz-workflow-prod" }
    its('ack_deadline_seconds') { should cmp 10 }
    its('message_retention_duration') { should cmp "604800s" }
    its('expiration_policy.ttl') { should cmp "2678400s" }
  end
end