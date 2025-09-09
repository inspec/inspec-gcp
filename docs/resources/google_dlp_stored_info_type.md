+++
title = "google_dlp_stored_info_type resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_stored_info_type"
identifier = "inspec/resources/gcp/google_dlp_stored_info_type Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_stored_info_type` InSpec audit resource to to test a Google Cloud StoredInfoType resource.

## Examples

```ruby
describe google_dlp_stored_info_type(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}",name: '') do
it { should exist }
its('name') { should cmp 'i-inspec-gcp-dlp' }
its('type') { should cmp 'INSPECT_JOB' }
its('state') { should cmp 'ACTIVE' }
end

describe google_dlp_stored_info_type(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}", name: 'nonexistent') do
it { should_not exist }
end

```

## Properties

Properties that can be accessed from the `google_dlp_stored_info_type` resource:


  * `name`: The resource name of the info type. Set by the server.

  * `description`: A description of the info type.

  * `display_name`: User set display name of the info type.

  * `regex`: Regular expression which defines the rule.

    * `pattern`: Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.

    * `group_indexes`: The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.

  * `dictionary`: Dictionary which defines the rule.

    * `word_list`: List of words or phrases to search for.

      * `words`: Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits.

    * `cloud_storage_path`: Newline-delimited file of words in Cloud Storage. Only a single file is accepted.

      * `path`: A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt`

  * `large_custom_dictionary`: Dictionary which defines the rule.

    * `output_path`: Location to store dictionary artifacts in Google Cloud Storage. These files will only be accessible by project owners and the DLP API. If any of these artifacts are modified, the dictionary is considered invalid and can no longer be used.

      * `path`: A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt`

    * `cloud_storage_file_set`: Set of files containing newline-delimited lists of dictionary phrases.

      * `url`: The url, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed.

    * `big_query_field`: Field in a BigQuery table where each cell represents a dictionary phrase.

      * `table`: Field in a BigQuery table where each cell represents a dictionary phrase.

        * `project_id`: The Google Cloud Platform project ID of the project containing the table.

        * `dataset_id`: The dataset ID of the table.

        * `table_id`: The name of the table.

      * `field`: Designated field in the BigQuery table.

        * `name`: Name describing the field.

  * `parent`: The parent of the info type in any of the following formats:  * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}`


## GCP permissions
