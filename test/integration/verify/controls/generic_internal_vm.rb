title 'Internal Virtual Machine Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_int_vm_name = attribute(:gcp_int_vm_name, default: '', description: 'The GCP VM name.')
gcp_int_vm_size = attribute(:gcp_int_vm_size, default: '', description: 'The GCP VM size.')
#gcp_int_vm_image = attribute(:gcp_int_vm_image, default: '', description: 'The GCP VM image.')

control 'gcp-generic-vm-linux-internal-1.0' do

  impact 1.0
  title 'Ensure Internal VM was built and has the correct properties'

  describe google_compute_instance(project: gcp_project_id, zone: gcp_zone, name: gcp_int_vm_name) do
    it { should exist }
    its('name') { should eq gcp_int_vm_name }
    its('zone') { should match gcp_zone }

    # the machine should not be tainted
    its('tainted?') { should be false }

    # the machine should not be untrusted
    its('untrusted?') { should be false }

    its('machine_type') { should match  gcp_int_vm_size}
    # can't easily get the os family from running instance...
    #its('source_image') { should eq  gcp_int_vm_image}

    # we get Skylake and Broadwell for example
    its('cpu_platform') { should match "Intel" }
    its('status') { should eq 'RUNNING' }

    its('kind') { should eq "compute#instance" }

    # there's one default tag e.g. => {:fingerprint=>"\xE3e\xA6J\x90|\xAD#"}
    its('tag_count'){should eq 1}

    # see if the disk is present with the correct name
    its('disk_count'){should eq 1}

    # confirm there is only one network interface attached
    #     it { should have_network_tag('test') }
    # qn here on how best to pass arguments??
    #
#    its('disks_source(0)') { should eq gcp_int_vm_name }
#    it { should disks_source_name_equal(0,gcp_int_vm_name) }
    its('first_disks_source_name') { should eq gcp_int_vm_name }
    its('first_disks_first_license') { should match "ubuntu"}

  end

end
