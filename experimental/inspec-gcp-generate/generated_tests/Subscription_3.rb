title 'Test GCP Subscription resource.'

control 'Subscription_3' do
  impact 1.0
  title 'Subscription resource test'

  describe google_pubsub_subscription({:project=>"graphite-test-sam-chef", :name=>"gcr-analysis-e54d108faf54fcfa61ab8c00e1f7144f"}) do
    it { should exist }

    its('name') { should cmp "gcr-analysis-e54d108faf54fcfa61ab8c00e1f7144f" }
    its('topic') { should cmp "projects/graphite-test-sam-chef/topics/gcr" }
    its('push_config.push_endpoint') { should cmp "rpc://blade:us-vulnz-workflow-prod" }
    its('ack_deadline_seconds') { should cmp 10 }
    its('message_retention_duration') { should cmp "604800s" }
    its('expiration_policy.ttl') { should cmp "2678400s" }
  end
end