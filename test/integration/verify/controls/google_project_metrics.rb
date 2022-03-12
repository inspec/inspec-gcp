title 'Test GCP google_project_metrics resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
logging_metric = input('logging_metric', value: {
  "name": "some/metric",
  "filter": "resource.type=gae_app AND severity>=ERROR",
  "metric_kind": "DELTA",
  "value_type": "INT64"
}, description: 'Logging metric definition')

control 'google_project_metrics-1.0' do
  impact 1.0
  title 'google_project_metrics resource test'

  describe google_project_metrics(project: gcp_project_id) do
    it { should exist }
    its('metric_filters') { should include logging_metric['filter'] }
    its('metric_names') { should include logging_metric['name'] }
  end

  describe.one do
    google_project_metrics(project: gcp_project_id).metric_types.each do |metric_type|
      describe metric_type do
        it { should match logging_metric['name'] }
      end
    end
  end
end
