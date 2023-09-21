---
title: About the google_vertex_ai_operation resource
platform: gcp
---

## Syntax
A `google_vertex_ai_operation` is used to test a Google Operation resource

## Examples
```
describe google_vertex_ai_operation(name: "projects/#{gcp_project_id}/locations/#{operation['region']}/operations/#{operation['name']}", region: ' value_region') do
	it { should exist }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_operation(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_operation` resource:


  * `name`: The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.

  * `response`: The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.

    * `additional_properties`: Properties of the object. Contains field @type with type URL.

  * `metadata`: Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.

    * `additional_properties`: Properties of the object. Contains field @type with type URL.

  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `done`: If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.


## GCP Permissions
