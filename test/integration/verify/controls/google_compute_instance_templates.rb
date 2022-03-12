title 'Test GCP google_compute_instance_templates resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
instance_template = input('instance_template', value: {
  "name": "inspec-gcp-instance-template",
  "description": "A description of the instance template",
  "instance_description": "A description of the instance itself",
  "machine_type": "f1-micro",
  "tag": "foo",
  "can_ip_forward": false,
  "scheduling_automatic_restart": true,
  "scheduling_on_host_maintenance": "MIGRATE",
  "disk_source_image": "debian-cloud/debian-9",
  "disk_auto_delete": true,
  "disk_boot": true,
  "network_interface_network": "default",
  "service_account_scope": "storage-ro"
}, description: 'An instance template definition')

control 'google_compute_instance_templates-1.0' do
  impact 1.0
  title 'google_compute_instance_templates resource test'

  describe google_compute_instance_templates(project: gcp_project_id) do
    its('names') { should include instance_template['name'] }
  end
end
