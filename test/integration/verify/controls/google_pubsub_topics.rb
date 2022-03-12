title 'Test GCP google_pubsub_topics resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
topic = input('topic', value: {"name"=>"inspec-gcp-topic"})

control 'google_pubsub_topics-1.0' do
  impact 1.0
  title 'google_pubsub_topics resource test'

  describe google_pubsub_topics(project: gcp_project_id) do
    it { should exist }
    its('names') { should include topic['name'] }
    its('count') { should be >=1 }
  end

  describe.one do
    google_pubsub_topics(project: gcp_project_id).names.each do |topic_name|
      describe google_pubsub_topic(project: gcp_project_id, name: topic_name) do
        it { should exist }
      end
    end
  end
end
