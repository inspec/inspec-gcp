title 'Test GCP google_project_metric resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
logging_metric = input('logging_metric', value: {
  "name": "some/metric",
  "filter": "resource.type=gae_app AND severity>=ERROR",
  "metric_kind": "DELTA",
  "value_type": "INT64"
}, description: 'Logging metric definition')

control 'google_project_metric-1.0' do
  impact 1.0
  title 'google_project_metric resource test'

  describe google_project_metric(project: gcp_project_id, name: logging_metric['name']) do
    it { should exist }
    its('filter') { should cmp logging_metric['filter'] }
    its('metric_descriptor.metric_kind') { should cmp logging_metric['metric_kind'] }
    its('metric_descriptor.value_type') { should cmp logging_metric['value_type'] }
  end

  describe google_project_metric(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
