title 'Test GCP google_resourcemanager_folders resource.'

folder = input('folder', value: {
  "display_name"=>"inspec-gcp-folder"
})
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of this folder')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_resourcemanager_folders-1.0' do
  impact 1.0
  title 'google_resourcemanager_folders resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe.one do
    google_resourcemanager_folders(parent: "organizations/#{gcp_organization_id}").display_names.each do |display_name|
      describe display_name do
        it { should eq folder['display_name'] }
      end
    end
  end
end
