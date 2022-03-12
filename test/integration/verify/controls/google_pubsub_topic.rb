title 'Test GCP google_pubsub_topic resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
topic = input('topic', value: {
  "name"=>"inspec-gcp-topic"
})

control 'google_pubsub_topic-1.0' do
  impact 1.0
  title 'google_pubsub_topic resource test'

  describe google_pubsub_topic(project: gcp_project_id, name: topic['name']) do
    it { should exist }
  end

end
