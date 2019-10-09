title 'Test GCP Topic resource.'

control 'Topic_0' do
  impact 1.0
  title 'Topic resource test'

  describe google_pubsub_topic({:project=>"graphite-test-sam-chef", :name=>"gcr"}) do
    it { should exist }

    its('name') { should cmp "gcr" }
    its('message_storage_policy.allowed_persistence_regions') { should include "asia-east1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "asia-northeast1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "asia-southeast1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "australia-southeast1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-north1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-west1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-west2" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-west3" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-west4" }
    its('message_storage_policy.allowed_persistence_regions') { should include "europe-west6" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-central1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-central2" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-east1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-east4" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-west1" }
    its('message_storage_policy.allowed_persistence_regions') { should include "us-west2" }
  end
end