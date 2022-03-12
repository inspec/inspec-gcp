title 'Test GCP google_spanner_instance_iam_policy resource.'

gcp_project_id = input(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
spannerinstance = input('spannerinstance', default: {
  "config": "regional-us-east1",
  "name": "spinstance",
  "display_name": "inspectest",
  "num_nodes": 1,
  "label_key": "env",
  "label_value": "test"
}, description: 'Cloud Spanner definition')
gcp_service_account_display_name = input(:gcp_service_account_display_name, default:'', description: 'Service account display name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_spanner_instance_iam_policy-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'google_spanner_instance_iam_policy resource test'

  describe.one do
    google_spanner_instance_iam_policy(project: gcp_project_id, name: spannerinstance['name']).bindings.each do |binding|
      describe binding do
        its('role') { should eq "roles/editor" }
        its('members') { should include "serviceAccount:#{gcp_service_account_display_name}-sp@#{gcp_project_id}.iam.gserviceaccount.com" }
      end
    end
  end
end
