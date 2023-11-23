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

title 'Test GCP google_dataproc_project_region_cluster resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  project_region_cluster = input('project_region_cluster', value: {
  "cluster_name": "value_clustername",
  "project_id": "value_projectid",
  "region": "value_region"
}, description: 'project_region_cluster description')
control 'google_dataproc_project_region_cluster-1.0' do
  impact 1.0
  title 'google_dataproc_project_region_cluster resource test'

  describe google_dataproc_project_region_cluster(clusterName: project_region_cluster['clusterName'], projectId: project_region_cluster['projectId'], region: project_region_cluster['region']) do
  	it { should exist }

  end

  describe google_dataproc_project_region_cluster(clusterName: project_region_cluster['clusterName'], projectId: project_region_cluster['projectId'], region: project_region_cluster['region']) do
  	it { should_not exist }
  end
end
