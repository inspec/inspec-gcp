---
title: About the Topic resource
platform: gcp
---


## Syntax
A `google_pubsub_topics` is used to test a Google Topic resource

## Examples
```
describe google_pubsub_topics(project: '') do
  it { should exist }
  its('names') { should include 'inspec-gcp-topic' }
  its('count') { should eq 1 }
end

google_pubsub_topics(project: '').names.each do |topic_name|
  describe google_pubsub_topic(project: '', name: topic_name) do
    its('name') { should eq 'inspec-gcp-topic' }
  end
end

```

## Properties
Properties that can be accessed from the `google_pubsub_topics` resource:

See [google_pubsub_topic.md](google_pubsub_topic.md) for more detailed information
  * `names`: an array of `google_pubsub_topic` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
