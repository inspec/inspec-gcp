title 'Internal Windows Virtual Machine Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_windows_int_vm_name = attribute(:gcp_windows_int_vm_name, default: '', description: 'The GCP VM name.')
gcp_windows_int_vm_size = attribute(:gcp_windows_int_vm_size, default: '', description: 'The GCP VM size.')
#gcp_windows_int_vm_image = attribute(:gcp_int_vm_size, default: '', description: 'The GCP VM size.')

control 'gcp-generic-vm-windows-internal-1.0' do

  impact 1.0
  title 'Ensure Windows Internal VM was built and has the correct properties'

  describe gcp_instance(project: gcp_project_id, zone: gcp_zone, name: gcp_windows_int_vm_name) do
    it { should exist }
    its('name') { should eq gcp_windows_int_vm_name }
    its('zone') { should eq gcp_zone }

    its('machine_type') { should eq  gcp_windows_int_vm_size}
    # can't easily get the os family from running instance...
    #its('source_image') { should eq  gcp_int_vm_image}

    its('cpu_platform') { should eq "Intel Skylake" }
    its('status') { should eq 'running' }

    its('kind') { should eq "compute#instance" }

    # there's one default tag e.g. => {:fingerprint=>"\xE3e\xA6J\x90|\xAD#"}
    its('tag_count'){should eq 1}

    # see if the disk is present with the correct name
    its('disk_count'){should eq 1}
    its('first_disks_source_name') { should eq gcp_windows_int_vm_name }
    its('first_disks_first_license') { should match "windows"}

  end

end
