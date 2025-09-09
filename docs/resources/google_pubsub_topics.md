+++
title = "google_pubsub_topics resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_pubsub_topics"
identifier = "inspec/resources/gcp/google_pubsub_topics Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_pubsub_topics` InSpec audit resource to to test a Google Cloud Topic resource.

## Examples

```ruby
describe google_pubsub_topics(project: 'chef-gcp-inspec') do
  it { should exist }
  its('names') { should include 'inspec-gcp-topic' }
  its('count') { should be >=1 }
end

describe.one do
  google_pubsub_topics(project: 'chef-gcp-inspec').names.each do |topic_name|
    describe google_pubsub_topic(project: 'chef-gcp-inspec', name: topic_name) do
      it { should exist }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_pubsub_topics` resource:

See [google_pubsub_topic](google_pubsub_topic) for more detailed information.

  * `names`: an array of `google_pubsub_topic` name
  * `kms_key_names`: an array of `google_pubsub_topic` kms_key_name
  * `labels`: an array of `google_pubsub_topic` labels
  * `message_storage_policies`: an array of `google_pubsub_topic` message_storage_policy

## Filter criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP permissions

Ensure the [Cloud Pub/Sub API](https://console.cloud.google.com/apis/library/pubsub.googleapis.com/) is enabled for the current project.
