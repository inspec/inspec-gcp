# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_compute_packet_mirroring resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  packet_mirroring = input('packet_mirroring', value: {
  "project": "ppradhan",
  "region": "us-central1",
  "kind": "compute#packetMirroring",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "self_link": "value_selflink",
  "self_link_with_id": "value_selflinkwithid",
  "name": "inspec-test-policy",
  "description": "value_description",
  "enable": "value_enable"
}, description: 'packet_mirroring description')
control 'google_compute_packet_mirroring-1.0' do
  impact 1.0
  title 'google_compute_packet_mirroring resource test'

  describe google_compute_packet_mirroring(name: packet_mirroring['name'], project: gcp_project_id, region: packet_mirroring['region']) do
  	it { should exist }
  	its('kind') { should cmp packet_mirroring['kind'] }
  	its('id') { should cmp packet_mirroring['id'] }
  	its('creation_timestamp') { should cmp packet_mirroring['creation_timestamp'] }
  	its('self_link') { should cmp packet_mirroring['self_link'] }
  	its('self_link_with_id') { should cmp packet_mirroring['self_link_with_id'] }
  	its('name') { should cmp packet_mirroring['name'] }
  	its('description') { should cmp packet_mirroring['description'] }
  	its('region') { should cmp packet_mirroring['region'] }
  	its('enable') { should cmp packet_mirroring['enable'] }

  end

  describe google_compute_packet_mirroring(name: packet_mirroring['name'], project: gcp_project_id, region: packet_mirroring['region']) do
  	it { should_not exist }
  end
end
