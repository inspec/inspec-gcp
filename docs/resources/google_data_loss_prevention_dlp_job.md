---
title: About the google_data_loss_prevention_dlp_job resource
platform: gcp
---

## Syntax
A `google_data_loss_prevention_dlp_job` is used to test a Google DlpJob resource

## Examples
```
describe google_data_loss_prevention_dlp_job(project: 'chef-gcp-inspec', name: 'inspec-gcp-dlp') do
  it { should exist }
end

describe google_data_loss_prevention_dlp_job(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_data_loss_prevention_dlp_job` resource:


  * `name`: The resource name of the template. Set by the server.

  * `type`: An enum to represent the various types of DLP jobs.
  Possible values:
    * DLP_JOB_TYPE_UNSPECIFIED
    * INSPECT_JOB
    * RISK_ANALYSIS_JOB

  * `state`: Possible states of a job. New items may be added.
  Possible values:
    * JOB_STATE_UNSPECIFIED
    * PENDING
    * RUNNING
    * DONE
    * CANCELED
    * FAILED
    * ACTIVE

  * `create_time`: Time when the job started. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `start_time`: Time when the job was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.  Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `end_time`: Time when the job started. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `job_trigger_name`: If created by a job trigger, the resource name of the trigger that instantiated the job.

  * `errors`: Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `details`: Specifies free-text based transformations to be applied to the dataset.

      * `status`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type.  Example: { "id": 1234, "@type": "types.example.com/standard/id" }.

          * `@type`: type of field

          * `field1`: name of field

  * `action_details`: Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `deidentify_details`: Specifies free-text based transformations to be applied to the dataset.

      * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

        * `transformed_bytes`: Total size in bytes that were transformed in some way.

        * `transformation_count`: Number of successfully applied transformations.

        * `transformation_error_count`: Number of errors encountered while trying to apply transformations.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `snapshot_deidentify_template`: Snapshot of the state of the DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_structured_deidentify_template`: Snapshot of the state of the structured DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_image_redact_template`: Snapshot of the state of the image transformation DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

    * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type.  Example: { "id": 1234, "@type": "types.example.com/standard/id" }.

          * `@type`: type of field

          * `field1`: name of field

  * `risk_details`: Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `deidentify_details`: Specifies free-text based transformations to be applied to the dataset.

      * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

        * `transformed_bytes`: Total size in bytes that were transformed in some way.

        * `transformation_count`: Number of successfully applied transformations.

        * `transformation_error_count`: Number of errors encountered while trying to apply transformations.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `snapshot_deidentify_template`: Snapshot of the state of the DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_structured_deidentify_template`: Snapshot of the state of the structured DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_image_redact_template`: Snapshot of the state of the image transformation DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

    * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type.  Example: { "id": 1234, "@type": "types.example.com/standard/id" }.

          * `@type`: type of field

          * `field1`: name of field

  * `inspect_details`: Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `deidentify_details`: Specifies free-text based transformations to be applied to the dataset.

      * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

        * `transformed_bytes`: Total size in bytes that were transformed in some way.

        * `transformation_count`: Number of successfully applied transformations.

        * `transformation_error_count`: Number of errors encountered while trying to apply transformations.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `snapshot_deidentify_template`: Snapshot of the state of the DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_structured_deidentify_template`: Snapshot of the state of the structured DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_image_redact_template`: Snapshot of the state of the image transformation DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `transformation_error_handling`: The status code, which should be an enum value of google.rpc.Code.

    * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English.  Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type.  Example: { "id": 1234, "@type": "types.example.com/standard/id" }.

          * `@type`: type of field

          * `field1`: name of field

  * `parent`: The parent of the template in any of the following formats:  * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}`


## GCP Permissions
