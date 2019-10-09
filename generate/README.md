** This tool is experimental and may change with little notice **

## What this tool does

Allows a user to generate InSpec controls from a GCP environment. Similar to [inspec-iggy](https://github.com/mattray/inspec-iggy) but without the requirement of the infrastructure being managed via Terraform. This tool gathers info on the environment by querying the GCP APIs directly. Currently it only works for a single GCP project, but in the future this could be modified.

# Instructions

## Install bundle & inspec CLI
Follow directions from https://github.com/inspec/inspec-gcp/ about prerequisites. This tool is based heavily off 
of the inspec-gcp resource pack, so setup is similar. Individual APIs need to be enabled if you wish to generate 
tests for resources that use that API.

You will need ruby 2.5+ and bundler installed, run `bundle install` in this directory to ensure dependencies are installed

## Set environment variables:

### Required

`GCP_PROJECT_NAME=my-gcp-project`
The name of the GCP project to generate tests for. Currently this tool only works for a single project. This may change in the future to accommodate an entire organization

`GOOGLE_APPLICATION_CREDENTIALS=/path/to/serviceaccount.json`
Gives InSpec access to view the GCP account in question. This must be created manually either via the 
console or a CLI tool like `gcloud`. See https://cloud.google.com/iam/docs/understanding-service-accounts
This must be a JSON service account file.

### Optional

`CNF_PATH=/path/to/config/directory`
Path to the directory containing configuration files for modifying which tests to generate.

`OUTPUT_PATH=/path/to/output/directory` (must exist)
This points to the directory where generated tests will be output

`TEMPLATE_PATH=/path/to/generated_test_template.erb`
`generated_test_template.erb` is provided with this resource pack.

## Create configuration files (optional)

Resources for which tests are generated can be controlled via configuration files for each type of resource. Configuration files are to be placed within the `CNF_PATH` directory, and are YAML files that contain lists of filters and ignored fields.

Configuration files are named the same as the InSpec resource for that GCP resource. For example, Google Compute Instances are represented by the InSpec resource `google_compute_instance.rb` and configuration file `google_compute_instance.yaml`.

Configuration files have two arrays, `filters` and `ignore_fields`. 

** Filters are not currently supported **
Filters are ruby code that is evaluated in context of each potential resource to generate tests for. They have access to the InSpec resource in question as a variable `resource` and return a boolean for if this resource should generate a test. For example, for a Compute Disk `resource` would be a [disk](https://github.com/inspec/inspec-gcp/blob/master/libraries/google_compute_disk.rb) object and have access to all of the [properties](https://github.com/inspec/inspec-gcp/blob/master/docs/resources/google_compute_disk.md) for that disk.

This allows a user to generate tests based on their needs. For example, a `google_compute_instance.yaml` file of the following:
```
ignore_fields: []
filters: 
  - resource.status == "RUNNING"
```

Would generate tests for every compute instance that is currently running.

`ignore_fields` is used to ignore certain fields when writing an InSpec test for a type of resource. These must match the property name in the [markdown doc](https://github.com/inspec/inspec-gcp/tree/master/docs/resources) for the resource. This only works for top level properties currently.

This allows a user to omit extraneous fields when generating tests. For example, a `google_compute_instance.yaml` file of the following:
```
ignore_fields: ['creation_timestamp', 'metadata']
filters: []
```

Would generate tests for every Compute Instance, but will omit any reference to `creation_timestamp` and `metadata` within those tests.

Common use of `filters` would be to exclude managed resources, such as Compute Instances managed by Instance Group Managers. These can be ephemeral resources, so writing tests against individuals may not be useful. 

## Create InSpec profile

I have included a collection of generation tests within the `gen-controls` directory in this package. Each of these will generate tests for the GCP resource it is named after. `compute_instance.rb` is an InSpec test that will generate tests for all Compute Instances in the project. I have included an InSpec profile at `./generate-profile` that will use the resources included in this package. Add any tests from the `gen-controls` directory to the `./generate-profile/controls` directory to generate tests for those types of resources.

```
# Move one (or more) tests to the control folder of the included InSpec profile.
cp gen-controls/* generate-profile/controls/
```

## Run InSpec profile

Run the InSpec profile with 
```
# From the inspec-gcp-generate directory
bundle install
bundle exec inspec exec generate-profile -t gcp://
ls $OUTPUT_PATH
```
The tests may take a while to execute, as they need to iterate every resource in the project. Executing the tests will not produce any command line output, see the `OUTPUT_DIRECTORY` for results. I recommend starting with a small subset of resources by only including a single test from the `generate` directory at first to ensure everything is working.

You can now execute the generated tests to verify that they work correctly