title 'Public IP Address Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_ext_compute_address_name = attribute(:gcp_ext_compute_address_name,default: '',description:'The GCP compute address.')
gcp_ext_vm_name = attribute(:gcp_ext_vm_name, default: '', description: 'The GCP generic external VM name.')

control 'gcp-generic-public-ip-address-1.0' do

  impact 1.0
  title 'Ensure that the Public IP Address has been configured correctly'

  describe google_compute_address(project: gcp_project_id, location: gcp_location, name: gcp_ext_compute_address_name) do

    its('name') { should eq gcp_ext_compute_address_name }

    # the actual ip address should exist
    its('address_ip_exists')  { should be true }

    # the address should not be tainted
    its('tainted?') { should be false }

    # the address should not be untrusted
    its('untrusted?') { should be false }

    its('region') { should match gcp_location}
    its('kind') { should eq "compute#address" }

    # we attached this to the external generic vm so the status should be "in_use"
    its('status') { should eq "IN_USE" }

    #in this case the generic external VM should be listed as the only user
    its('user_count') { should eq 1 }
    its('user_resource_name') { should eq gcp_ext_vm_name}
  end
end