title 'Test GCP Subscription resource.'

control 'Subscription_2' do
  impact 1.0
  title 'Subscription resource test'

  describe google_pubsub_subscription({:project=>"graphite-test-sam-chef", :name=>"gcr-analysis-0f8f27c6e0df07813c21a879f0e419e7"}) do
    it { should exist }

    its('name') { should cmp "gcr-analysis-0f8f27c6e0df07813c21a879f0e419e7" }
    its('topic') { should cmp "projects/graphite-test-sam-chef/topics/gcr" }
    its('push_config.push_endpoint') { should cmp "rpc://blade:us-vulnz-workflow-prod" }
    its('ack_deadline_seconds') { should cmp 10 }
    its('message_retention_duration') { should cmp "604800s" }
    its('expiration_policy.ttl') { should cmp "2678400s" }
  end
end