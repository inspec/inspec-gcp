---
title: About the google_parameter_manager_parameter_version resource
platform: gcp
---

## Syntax
A `google_parameter_manager_parameter_version` is used to test a Google Parameter Version resource

## Examples
```
describe google_parameter_manager_parameter_version(name: 'projects/<project_id>/locations/global/parameters/<parameter_id>/versions/<parameter_version_id>') do
	it { should exist }
end
describe google_parameter_manager_parameter_version(name: "does_not_exit") do
	it { should_not exist }
end
describe google_parameter_manager_parameter_version(name: 'projects/<project_id>/locations/<location_id>/parameters/<parameter_id>/versions/<parameter_version_id>', region: <location_id>) do
	it { should exist }
end
describe google_parameter_manager_parameter_version(name: "does_not_exit", region: <location_id>) do
	it { should_not exist }
end
describe google_parameter_manager_parameter_version(name: 'projects/<project_id>/locations/global/parameters/<parameter_id>/versions/<parameter_version_id>', render_secret: true) do
	it { should exist }
end
describe google_parameter_manager_parameter_version(name: "does_not_exit", render_secret: true) do
	it { should_not exist }
end
describe google_parameter_manager_parameter_version(name: 'projects/<project_id>/locations/<location_id>/parameters/<parameter_id>/versions/<parameter_version_id>', region: <location_id>, render_secret: true) do
	it { should exist }
end
describe google_parameter_manager_parameter_version(name: "does_not_exit", region: <location_id>, render_secret: true) do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_parameter_manager_parameter_version` resource:

  * `name`: The resource name of the Parameter Version. Format: `projects/{{project_id}}/locations/global/parameters/{{parameter_id}}/versions/{{parameter_version_id}}` or `projects/{{project_id}}/locations/{{location_id}}/parameters/{{parameter_id}}/versions/{{parameter_version_id}}`

  * `create_time`: The time at which the Parameter Version was created.

  * `update_time`: The time at which the Parameter Version was updated.

  * `disabled`: The state of Parameter Version.

  * `kms_key_version`: The resource name of the Cloud KMS CryptoKeyVersion used to decrypt parameter version payload. Format `projects/{{project_id}}/locations/global/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}/cryptoKeyVersions/{{crypto_key_version}}` or  `projects/{{project_id}}/locations/{{location_id}}/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}/cryptoKeyVersions/{{crypto_key_version}}`

  * `rendered_payload`: The rendered payload of the Parameter Version.

  * `payload`: The payload of the ParameterVersion.

    * `data`: The parameter data. Must be no larger than 1MiB.

## GCP Permissions

Ensure the [Parameter Manager API](https://console.cloud.google.com/apis/library/parametermanager.googleapis.com/) is enabled for the current project.
