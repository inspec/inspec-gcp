---
title: About the google_dlp_job resource
platform: gcp
---

## Syntax
A `google_dlp_job` is used to test a Google Job resource

## Examples
```

describe google_dlp_job(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}", name: 'i-inspec-gcp-dlp') do
  it { should exist }
  its('name') { should cmp 'i-inspec-gcp-dlp' }
  its('type') { should cmp 'INSPECT_JOB' }
  its('state') { should cmp 'ACTIVE' }
  its('inspectDetails.requestedOptions.snapshotInspectTemplate') { should cmp '' }
end

describe google_dlp_job(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}", name: 'nonexistent') do
  it { should_not exist }
end

```

## Properties
Properties that can be accessed from the `google_dlp_job` resource:


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

  * `start_time`: Time when the job was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `end_time`: Time when the job started. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

  * `job_trigger_name`: If created by a job trigger, the resource name of the trigger that instantiated the job.

  * `errors`: Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `details`: Specifies free-text based transformations to be applied to the dataset.

      * `status`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "type" contains a URI identifying the type. Example: { "id": 1234, "type": "types.example.com/standard/id" }.

          * `type`: type of field

          * `field1`: name of field

  * `act_det`: actionDetails - Details information about an error encountered during job execution or the results of an unsuccessful activation of the JobTrigger.

    * `dt_det`: DeIdentifyDetails - Specifies free-text based transformations to be applied to the dataset.

      * `de_stats`: deidentifyStats - Specifies free-text based transformations to be applied to the dataset.

        * `transformed_bytes`: Total size in bytes that were transformed in some way.

        * `transformation_count`: Number of successfully applied transformations.

        * `transformation_error_count`: Number of errors encountered while trying to apply transformations.

      * `req_opt`: requestedOptions The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `snapshot_dt`: snapshotDeidentifyTemplate Snapshot of the state of the DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `config`: deidentifyConfig The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `tf_error_handling`: transformationErrorHandling The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_structured_dt`: snapshotStructuredDeidentifyTemplate Snapshot of the state of the structured DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: The status code, which should be an enum value of google.rpc.Code.

          * `display_name`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `description`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `create_time`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `update_time`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

          * `deidentify_config`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

            * `tf_error_handling`: transformationErrorHandling The status code, which should be an enum value of google.rpc.Code.

        * `snapshot_img_rt`: snapshotImageRedactTemplate Snapshot of the state of the image transformation DeidentifyTemplate from the Deidentify action at the time this job was run.

          * `name`: Output only. The template name. The template will have one of the following formats: projects/PROJECT_ID/deidentifyTemplates/TEMPLATE_ID OR organizations/ORGANIZATION_ID/deidentifyTemplates/TEMPLATE_ID

          * `display_name`: Display name (max 256 chars).

          * `description`: Short description (max 256 chars).

          * `create_time`: Output only. The creation timestamp of an inspectTemplate. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

          * `update_time`: Output only. The creation timestamp of an inspectTemplate. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

          * `dt_con`: deidentifyConfig The configuration that controls how the data will change.

            * `tf_error_handling`: transformationErrorHandling How to handle transformation errors during de-identification. A transformation error occurs when the requested transformation is incompatible with the data. For example, trying to de-identify an IP address using a DateShift transformation would result in a transformation error, since date info cannot be extracted from an IP address. Information about any incompatible transformations, and how they were handled, is returned in the response as part of the TransformationOverviews.

            * `info_type_tf`: infoTypeTransformations Treat the dataset as free-form text and apply the same free text transformation everywhere.

              * `tf`: transformations A type of transformation that will scan unstructured text and apply various PrimitiveTransformations to each finding, where the transformation is applied to only values that were identified as a specific infoType.

                * `info_types`: InfoTypes to apply the transformation to. An empty list will cause this transformation to apply to all findings that correspond to infoTypes that were requested in InspectConfig.

                  * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type. When sending Cloud DLP results to Data Catalog, infoType names should conform to the pattern [A-Za-z0-9$_-]{1,64}.

                  * `version`: Optional version name for this InfoType.

                  * `sensitivity_score`: Score is calculated from of all elements in the data profile. A higher level means the data is more sensitive.

                    * `score`: Various sensitivity score levels for resources. Enums **SENSITIVITY_SCORE_UNSPECIFIED** - Unused. **SENSITIVITY_LOW** -	No sensitive information detected. The resource isn't publicly accessible. **SENSITIVITY_MODERATE** -	Medium risk. Contains personally identifiable information (PII), potentially sensitive data, or fields with free-text data that are at a higher risk of having intermittent sensitive data. Consider limiting access. **SENSITIVITY_HIGH** -	High risk. Sensitive personally identifiable information (SPII) can be present. Exfiltration of data can lead to user data loss. Re-identification of users might be possible. Consider limiting usage and or removing SPII.
                    Possible values:
                      * SENSITIVITY_SCORE_UNSPECIFIED
                      * SENSITIVITY_LOW
                      * SENSITIVITY_MODERATE
                      * SENSITIVITY_HIGH

            * `rec_tf`: recordTransformations - Treat the dataset as free-form text and apply the same free text transformation everywhere.

              * `field_tf`: The transformation to apply to the field.

                * `fields`: InfoTypes to apply the transformation to. An empty list will cause this transformation to apply to all findings that correspond to infoTypes that were requested in InspectConfig.

                  * `name`: Name describing the field.

                * `con`: condition A condition for determining whether a transformation should be applied to a field.

                  * `exps`: expressions Only apply the transformation if the condition evaluates to true for the given RecordCondition. The conditions are allowed to reference fields that are not used in the actual transformation.Example Use Cases: Apply a different bucket transformation to an age column if the zip code column for the same record is within a specific range. Redact a field if the date of birth field is greater than 85.

                    * `logical_operator`: The operator to apply to the result of conditions. Default and currently only supported value is AND. Enums **LOGICAL_OPERATOR_UNSPECIFIED** -	Unused **AND** -	Conditional AND
                    Possible values:
                      * LOGICAL_OPERATOR_UNSPECIFIED
                      * AND

                    * `con`: Conditions to apply to the expression.

                      * `cond`: A collection of conditions.

                        * `field`: Designated field in the BigQuery table.

                          * `name`: Name describing the field.

                        * `operator`: Operators available for comparing the value of fields. Enums **RELATIONAL_OPERATOR_UNSPECIFIED**	Unused **EQUAL_TO**	Equal. Attempts to match even with incompatible types. **NOT_EQUAL_TO**	Not equal to. Attempts to match even with incompatible types. **GREATER_THAN**	Greater than. **LESS_THAN**	Less than. **GREATER_THAN_OR_EQUALS**	Greater than or equals. **LESS_THAN_OR_EQUALS**	Less than or equals. **EXISTS**	Exists
                        Possible values:
                          * RELATIONAL_OPERATOR_UNSPECIFIED
                          * EQUAL_TO
                          * NOT_EQUAL_TO
                          * GREATER_THAN
                          * LESS_THAN
                          * GREATER_THAN_OR_EQUALS
                          * LESS_THAN_OR_EQUALS
                          * EXISTS

                        * `new_val`: newValue Replace each input value with a given value.

                          * `integer_value`: An integer value.

                          * `float_value`: A float value.

                          * `string_value`: A string value.

                          * `boolean_value`: A boolean value.

                          * `timestamp_value`: A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

                          * `time_val`: Represents a time of day.

                            * `hours`: Hours of day in 24 hour format. Should be from 0 to 23.

                            * `minutes`: Minutes of hour of day. Must be from 0 to 59.

                            * `seconds`: Seconds of minutes of the time. Must normally be from 0 to 59.

                            * `nanos`: Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.

                          * `date_val`: dateValue Represents a whole or partial calendar date.

                            * `year`: Year of date. Must be from 1 to 9999, or 0 if specifying a date without a year.

                            * `month`: Month of year. Must be from 1 to 12, or 0 if specifying a year without a month and day.

                            * `day`: Day of month. Must be from 1 to 31 and valid for the year and month, or 0 if specifying a year by itself or a year and month where the day is not significant.

                          * `day_of_week_val`: datOfWeekValue Represents a day of the week.
                          Possible values:
                            * MONDAY
                            * TUESDAY
                            * WEDNESDAY
                            * THURSDAY
                            * FRIDAY
                            * SATURDAY
                            * SUNDAY

              * `rec_sup`: recordSuppressions - The transformation to apply to the field.

                * `con`: A condition for determining whether a transformation should be applied to a field.

                  * `exp`: expressions Only apply the transformation if the condition evaluates to true for the given RecordCondition. The conditions are allowed to reference fields that are not used in the actual transformation.Example Use Cases: Apply a different bucket transformation to an age column if the zip code column for the same record is within a specific range. Redact a field if the date of birth field is greater than 85.

                    * `logical_operator`: The operator to apply to the result of conditions. Default and currently only supported value is AND. Enums **LOGICAL_OPERATOR_UNSPECIFIED** -	Unused **AND** -	Conditional AND
                    Possible values:
                      * LOGICAL_OPERATOR_UNSPECIFIED
                      * AND

                    * `con`: Conditions to apply to the expression.

                      * `con`: A collection of conditions.

                        * `field`: Designated field in the BigQuery table.

                          * `name`: Name describing the field.

                        * `operator`: Operators available for comparing the value of fields. Enums **RELATIONAL_OPERATOR_UNSPECIFIED**	Unused **EQUAL_TO**	Equal. Attempts to match even with incompatible types. **NOT_EQUAL_TO**	Not equal to. Attempts to match even with incompatible types. **GREATER_THAN**	Greater than. **LESS_THAN**	Less than. **GREATER_THAN_OR_EQUALS**	Greater than or equals. **LESS_THAN_OR_EQUALS**	Less than or equals. **EXISTS**	Exists
                        Possible values:
                          * RELATIONAL_OPERATOR_UNSPECIFIED
                          * EQUAL_TO
                          * NOT_EQUAL_TO
                          * GREATER_THAN
                          * LESS_THAN
                          * GREATER_THAN_OR_EQUALS
                          * LESS_THAN_OR_EQUALS
                          * EXISTS

                        * `new_val`: newValue Replace each input value with a given value.

                          * `integer_val`: An integer value.

                          * `float_val`: A float value.

                          * `string_val`: A string value.

                          * `boolean_val`: A boolean value.

                          * `timestamp_val`: A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

                          * `time_val`: timeValue Represents a time of day.

                            * `hours`: Hours of day in 24 hour format. Should be from 0 to 23.

                            * `minutes`: Minutes of hour of day. Must be from 0 to 59.

                            * `seconds`: Seconds of minutes of the time. Must normally be from 0 to 59.

                            * `nanos`: Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.

                          * `date_val`: dateValue Represents a whole or partial calendar date.

                            * `year`: Year of date. Must be from 1 to 9999, or 0 if specifying a date without a year.

                            * `month`: Month of year. Must be from 1 to 12, or 0 if specifying a year without a month and day.

                            * `day`: Day of month. Must be from 1 to 31 and valid for the year and month, or 0 if specifying a year by itself or a year and month where the day is not significant.

                          * `day_of_week_val`: dayOfWeekValue Represents a day of the week.
                          Possible values:
                            * MONDAY
                            * TUESDAY
                            * WEDNESDAY
                            * THURSDAY
                            * FRIDAY
                            * SATURDAY
                            * SUNDAY

            * `image_tf`: ImageTransformations Treat the dataset as free-form text and apply the same free text transformation everywhere.

              * `redaction_color`: Treat the dataset as free-form text and apply the same free text transformation everywhere.

                * `red`: red color

                * `green`: green color

                * `blue`: blue color

              * `selected_info_types`: Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference.  When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated.

                * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

              * `all_info_types`: Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference.  When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated.

                * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

              * `all_text`: Apply to all text.

                * `red`: red color

                * `green`: green color

                * `blue`: blue color

    * `deidentify_stats`: Specifies free-text based transformations to be applied to the dataset.

      * `requested_options`: The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. Each Status message contains three pieces of data: error code, error message, and error details.

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

        * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use. An object containing fields of an arbitrary type. An additional field "type" contains a URI identifying the type. Example: { "id": 1234, "type": "types.example.com/standard/id" }.

          * `type`: type of field

          * `field1`: name of field

  * `risk_details`: Result of a risk analysis operation request.

  * `inspect_details`: Results from inspecting a data source.

  * `parent`: The parent of the template in any of the following formats:  * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}`


## GCP Permissions
