+++
title = "google_dlp_inspect_template resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dlp_inspect_template"
identifier = "inspec/resources/gcp/google_dlp_inspect_template resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dlp_inspect_template` InSpec audit resource to to test a Google Cloud InspectTemplate resource.

## Examples

```ruby
describe google_dlp_inspect_template(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}", name: 'i-inspec-gcp-dlp') do
it { should exist }
its('name') { should cmp 'i-inspec-gcp-dlp' }
its('type') { should cmp 'INSPECT_JOB' }
its('state') { should cmp 'ACTIVE' }
its('inspectDetails.requestedOptions.snapshotInspectTemplate') { should cmp '' }
end

describe google_dlp_inspect_template(parent: "projects/#{'chef-gcp-inspec'}/locations/#{'us-east-2'}", name: 'nonexistent') do
it { should_not exist }
end

```

## Properties

Properties that can be accessed from the `google_dlp_inspect_template` resource:


  * `name`: The resource name of the inspect template. Set by the server.

  * `description`: A description of the inspect template.

  * `display_name`: User set display name of the inspect template.

  * `inspect_config`: The core content of the template.

    * `exclude_info_types`: When true, excludes type information of the findings.

    * `include_quote`: When true, a contextual quote from the data that triggered a finding is included in the response.

    * `min_likelihood`: Only returns findings equal or above this threshold. See https://cloud.google.com/dlp/docs/likelihood for more info
    Possible values:
      * VERY_UNLIKELY
      * UNLIKELY
      * POSSIBLE
      * LIKELY
      * VERY_LIKELY

    * `limits`: Configuration to control the number of findings returned.

      * `max_findings_per_item`: Max number of findings that will be returned for each item scanned. The maximum returned is 2000.

      * `max_findings_per_request`: Max number of findings that will be returned per request/job. The maximum returned is 2000.

      * `max_findings_per_info_type`: Configuration of findings limit given for specified infoTypes.

        * `info_type`: Type of information the findings limit applies to. Only one limit per infoType should be provided. If InfoTypeLimit does not have an infoType, the DLP API applies the limit against all infoTypes that are found but not specified in another InfoTypeLimit.

          * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

        * `max_findings`: Max findings limit for the given infoType.

    * `info_types`: Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference.  When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated.

      * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

    * `content_options`: List of options defining data content to scan. If empty, text, images, and other content will be included.

    * `rule_set`: Set of rules to apply to the findings for this InspectConfig. Exclusion rules, contained in the set are executed in the end, other rules are executed in the order they are specified for each info type.

      * `info_types`: List of infoTypes this rule set is applied to.

        * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

      * `rules`: Set of rules to be applied to infoTypes. The rules are applied in order.

        * `hotword_rule`: Hotword-based detection rule.

          * `hotword_regex`: Regular expression pattern defining what qualifies as a hotword.

            * `pattern`: Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.

            * `group_indexes`: The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.

          * `proximity`: Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question.

            * `window_before`: Number of characters before the finding to consider. Either this or window_after must be specified

            * `window_after`: Number of characters after the finding to consider. Either this or window_before must be specified

          * `likelihood_adjustment`: Likelihood adjustment to apply to all matching findings.

            * `fixed_likelihood`: Set the likelihood of a finding to a fixed value. Either this or relative_likelihood can be set.
            Possible values:
              * VERY_UNLIKELY
              * UNLIKELY
              * POSSIBLE
              * LIKELY
              * VERY_LIKELY

            * `relative_likelihood`: Increase or decrease the likelihood by the specified number of levels. For example, if a finding would be POSSIBLE without the detection rule and relativeLikelihood is 1, then it is upgraded to LIKELY, while a value of -1 would downgrade it to UNLIKELY. Likelihood may never drop below VERY_UNLIKELY or exceed VERY_LIKELY, so applying an adjustment of 1 followed by an adjustment of -1 when base likelihood is VERY_LIKELY will result in a final likelihood of LIKELY. Either this or fixed_likelihood can be set.

        * `exclusion_rule`: The rule that specifies conditions when findings of infoTypes specified in InspectionRuleSet are removed from results.

          * `matching_type`: How the rule is applied. See the documentation for more information: https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#MatchingType
          Possible values:
            * MATCHING_TYPE_FULL_MATCH
            * MATCHING_TYPE_PARTIAL_MATCH
            * MATCHING_TYPE_INVERSE_MATCH

          * `dictionary`: Dictionary which defines the rule.

            * `word_list`: List of words or phrases to search for.

              * `words`: Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits.

            * `cloud_storage_path`: Newline-delimited file of words in Cloud Storage. Only a single file is accepted.

              * `path`: A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt`

          * `regex`: Regular expression which defines the rule.

            * `pattern`: Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.

            * `group_indexes`: The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.

          * `exclude_info_types`: Set of infoTypes for which findings would affect this rule.

            * `info_types`: If a finding is matched by any of the infoType detectors listed here, the finding will be excluded from the scan results.

              * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

    * `custom_info_types`: Custom info types to be used. See https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more.

      * `info_type`: CustomInfoType can either be a new infoType, or an extension of built-in infoType, when the name matches one of existing infoTypes and that infoType is specified in `info_types` field. Specifying the latter adds findings to the one detected by the system. If built-in info type is not specified in `info_types` list then the name is treated as a custom info type.

        * `name`: Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.

      * `likelihood`: Likelihood to return for this CustomInfoType. This base value can be altered by a detection rule if the finding meets the criteria specified by the rule.
      Possible values:
        * VERY_UNLIKELY
        * UNLIKELY
        * POSSIBLE
        * LIKELY
        * VERY_LIKELY

      * `exclusion_type`: If set to EXCLUSION_TYPE_EXCLUDE this infoType will not cause a finding to be returned. It still can be used for rules matching.
      Possible values:
        * EXCLUSION_TYPE_EXCLUDE

      * `regex`: Regular expression which defines the rule.

        * `pattern`: Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.

        * `group_indexes`: The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included.

      * `dictionary`: Dictionary which defines the rule.

        * `word_list`: List of words or phrases to search for.

          * `words`: Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits.

        * `cloud_storage_path`: Newline-delimited file of words in Cloud Storage. Only a single file is accepted.

          * `path`: A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt`

      * `stored_type`: A reference to a StoredInfoType to use with scanning.

        * `name`: Resource name of the requested StoredInfoType, for example `organizations/433245324/storedInfoTypes/432452342` or `projects/project-id/storedInfoTypes/432452342`.

  * `parent`: The parent of the inspect template in any of the following formats:  * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}`


## GCP permissions
