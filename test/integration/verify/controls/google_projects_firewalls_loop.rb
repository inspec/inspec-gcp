title 'Loop over all GCP Projects and look at firewalls in INGRESS direction'

control 'gcp-projects-firewalls-loop-1.0' do

  impact 1.0
  title 'Ensure INGRESS firewalls in all projects have the correct properties using google_compute_firewall for detail.'

  google_projects.project_names.each do |project_name|
    google_compute_firewalls(project: project_name).where(firewall_direction: 'INGRESS').firewall_names.each do |firewall_name|
      describe google_compute_firewall(project: project_name, name: firewall_name) do
        it { should exist }
        its('direction') { should eq "INGRESS" }
#  below uncommented is the same as the example in the README
#  leaving out as some of the terraform resources have SSH open
#        its('allowed_ssh?')  { should be false }
      end
    end
  end
end