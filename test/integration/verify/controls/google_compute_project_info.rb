title 'Test GCP Compute Project Info'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-compute-project-info-1.0' do

  impact 1.0
  title 'Ensure GCP Compute Project Info has the correct properties.'

  describe google_compute_project_info(project: gcp_project_id) do
    it { should exist }
    its('name') { should eq gcp_project_id }
  end
end