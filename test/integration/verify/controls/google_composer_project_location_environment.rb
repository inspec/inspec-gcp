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

title 'Test GCP google_composer_project_location_environment resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

# here ppradhan is a sample project id in the parent and name field

project_location_environment = input('project_location_environment', value: {
  "parent": "projects/ppradhan/locations/asia-east2",
  "name": "projects/ppradhan/locations/asia-east2/environments/inspec-test-composer-2",
  "config": {
    "gkeCluster": "projects/ppradhan/zones/asia-east2-a/clusters/asia-east2-inspec-test-comp-88997323-gke",
    "dagGcsPrefix": "gs://asia-east2-inspec-test-comp-88997323-bucket/dags",
    "nodeCount": 3,
    "softwareConfig": {
      "imageVersion": "composer-1.20.12-airflow-2.4.3",
      "pythonVersion": "3",
      "schedulerCount": 1
    },
    "nodeConfig": {
      "location": "projects/ppradhan/zones/asia-east2-a",
      "machineType": "projects/ppradhan/zones/asia-east2-a/machineTypes/n1-standard-1",
      "network": "projects/ppradhan/global/networks/default",
      "diskSizeGb": 100,
      "oauthScopes": [
        "https://www.googleapis.com/auth/cloud-platform"
      ],
      "serviceAccount": "165434197229-compute@developer.gserviceaccount.com",
      "ipAllocationPolicy": {}
    },
    "airflowUri": "https://ue20b0f31e51f44b8p-tp.appspot.com",
    "privateEnvironmentConfig": {
      "privateClusterConfig": {},
      "webServerIpv4CidrBlock": "172.31.255.0/24",
      "cloudSqlIpv4CidrBlock": "10.0.0.0/12"
    },
    "webServerNetworkAccessControl": {
      "allowedIpRanges": [
        {
          "value": "0.0.0.0/0",
          "description": "Allows access from all IPv4 addresses (default value)"
        },
        {
          "value": "::0/0",
          "description": "Allows access from all IPv6 addresses (default value)"
        }
      ]
    },
    "databaseConfig": {
      "machineType": "db-n1-standard-2"
    },
    "webServerConfig": {
      "machineType": "composer-n1-webserver-2"
    },
    "encryptionConfig": {},
    "maintenanceWindow": {
      "startTime": "2023-12-04T18:30:00Z",
      "endTime": "2023-12-04T22:30:00Z",
      "recurrence": "FREQ=WEEKLY;BYDAY=TH,FR,SA"
    },
    "workloadsConfig": {}
  },
  "labels": {
    "user": "inspec",
    "org": "chef",
  },
  "uuid": "e117678d-9dbf-4fe2-8bb0-888efb9bc97e",
  "state": "RUNNING",
  "createTime": "2023-12-05T07:45:52.257367Z",
  "updateTime": "2023-12-05T10:06:10.077790Z",
  "storageConfig": {
    "bucket": "asia-east2-inspec-test-comp-88997323-bucket"
  },
  },
  description: 'project_location_environment description')

control 'google_composer_project_location_environment-1.0' do
  impact 1.0
  title 'google_composer_project_location_environment resource test'

  describe google_composer_project_location_environment(name: project_location_environment['name']) do
  	it { should exist }
  	its('name') { should cmp project_location_environment['name'] }
  	its('uuid') { should cmp project_location_environment['uuid'] }
  	its('state') { should cmp project_location_environment['state'] }
  	its('create_time') { should cmp project_location_environment['createTime'] }
  	its('update_time') { should cmp project_location_environment['updateTime'] }
    its('config.gke_cluster') { should cmp project_location_environment['config'][:gkeCluster] }
    its('labels.additional_properties') { should cmp project_location_environment['labels'].transform_keys(&:to_s) }
    its('satisfies_pzs') { should cmp project_location_environment['satisfies_pzs'] }
    its('storage_config.bucket') { should cmp project_location_environment['storageConfig'][:bucket] }
  end

  describe google_composer_project_location_environment(name: "does_not_exist") do
  	it { should_not exist }
  end
end