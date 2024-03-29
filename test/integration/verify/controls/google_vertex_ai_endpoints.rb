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

title 'Test GCP google_vertex_ai_endpoints resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  endpoint = input('endpoint', value: {
  "name": "value_name",
  "region": "value_region",
  "parent": "value_parent",
  "update_time": "value_updatetime",
  "model_deployment_monitoring_job": "value_modeldeploymentmonitoringjob",
  "description": "value_description",
  "network": "value_network",
  "display_name": "value_displayname",
  "etag": "value_etag",
  "create_time": "value_createtime"
}, description: 'endpoint description')
control 'google_vertex_ai_endpoints-1.0' do
  impact 1.0
  title 'google_vertex_ai_endpoints resource test'

      describe google_vertex_ai_endpoints(parent: "projects/#{gcp_project_id}/locations/#{endpoint['region']}", region: endpoint['region']) do
      it { should exist }
    end
end
