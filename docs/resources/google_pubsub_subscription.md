---
title: About the google_pubsub_subscription resource
platform: gcp
---

## Syntax
A `google_pubsub_subscription` is used to test a Google Subscription resource

## Examples
```
describe google_pubsub_subscription(project: 'chef-gcp-inspec', name: 'inspec-gcp-subscription') do
  it { should exist }
end

describe google_pubsub_subscription(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_pubsub_subscription` resource:

  * `name`: Name of the subscription.

  * `topic`: A reference to a Topic resource.

  * `labels`: A set of key/value label pairs to assign to this Subscription.

  * `push_config`: If push delivery is used with this subscription, this field is used to configure it. An empty pushConfig signifies that the subscriber will pull and ack messages using API methods.

    * `push_endpoint`: A URL locating the endpoint to which messages should be pushed. For example, a Webhook endpoint might use "https://example.com/push".

    * `attributes`: Endpoint configuration attributes.  Every endpoint has a set of API supported attributes that can be used to control different aspects of the message delivery.  The currently supported attribute is x-goog-version, which you can use to change the format of the pushed message. This attribute indicates the version of the data expected by the endpoint. This controls the shape of the pushed message (i.e., its fields and metadata). The endpoint version is based on the version of the Pub/Sub API.  If not present during the subscriptions.create call, it will default to the version of the API used to make such call. If not present during a subscriptions.modifyPushConfig call, its value will not be changed. subscriptions.get calls will always return a valid version, even if the subscription was created without this attribute.  The possible values for this attribute are:  - v1beta1: uses the push format defined in the v1beta1 Pub/Sub API. - v1 or v1beta2: uses the push format defined in the v1 Pub/Sub API.

  * `ack_deadline_seconds`: This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. After message delivery but before the ack deadline expires and before the message is acknowledged, it is an outstanding message and will not be delivered again during that time (on a best-effort basis).  For pull subscriptions, this value is used as the initial value for the ack deadline. To override this value for a given message, call subscriptions.modifyAckDeadline with the corresponding ackId if using pull. The minimum custom deadline you can specify is 10 seconds. The maximum custom deadline you can specify is 600 seconds (10 minutes). If this parameter is 0, a default value of 10 seconds is used.  For push delivery, this value is also used to set the request timeout for the call to the push endpoint.  If the subscriber never acknowledges the message, the Pub/Sub system will eventually redeliver the message.

  * `message_retention_duration`: How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retainAckedMessages is true, then this also configures the retention of acknowledged messages, and thus configures how far back in time a subscriptions.seek can be done. Defaults to 7 days. Cannot be more than 7 days (`"604800s"`) or less than 10 minutes (`"600s"`).  A duration in seconds with up to nine fractional digits, terminated by 's'. Example: `"600.5s"`.

  * `retain_acked_messages`: Indicates whether to retain acknowledged messages. If `true`, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window.

  * `expiration_policy`: A policy that specifies the conditions for this subscription's expiration. A subscription is considered active as long as any connected subscriber is successfully consuming messages from the subscription or is issuing operations on the subscription. If expirationPolicy is not set, a default policy with ttl of 31 days will be used. The minimum allowed value for expirationPolicy.ttl is 1 day.

    * `ttl`: Specifies the "time-to-live" duration for an associated resource. The resource expires if it is not active for a period of ttl. The definition of "activity" depends on the type of the associated resource. The minimum and maximum allowed values for ttl depend on the type of the associated resource, as well. If ttl is not set, the associated resource never expires. A duration in seconds with up to nine fractional digits, terminated by 's'. Example - "3.5s".



## GCP Permissions

Ensure the [Cloud Pub/Sub API](https://console.cloud.google.com/apis/library/pubsub.googleapis.com/) is enabled for the current project.
