title 'Image Family'

gcp_int_vm_image = attribute(:gcp_ext_vm_image, default: '', description: 'The GCP VM image.')

control 'gcp-generic-image-family-1.0' do

  impact 1.0
  title 'Ensure that the image is correct'

  describe google_compute_image(project: gcp_int_vm_image.split('/').first, name: gcp_int_vm_image.split('/').last ) do

    its('name') { should match "ubuntu" }
    its('family') { should match "ubuntu" }
    its('kind') { should eq "compute#image" }
    # the image should be available for use
    its('status') { should eq "READY" }

  end
end