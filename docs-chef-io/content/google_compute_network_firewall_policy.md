+++
title = "google_compute_network_firewall_policy resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_network_firewall_policy"
identifier = "inspec/resources/gcp/google_compute_network_firewall_policy resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_network_firewall_policy` InSpec audit resource to to test a Google Cloud NetworkFirewallPolicy resource.

## Examples

```ruby
describe google_compute_network_firewall_policy(name: 'value_name', project: 'chef-gcp-inspec') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('fingerprint') { should cmp 'value_fingerprint' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('short_name') { should cmp 'value_shortname' }
	its('display_name') { should cmp 'value_displayname' }
	its('parent') { should cmp 'value_parent' }
	its('region') { should cmp 'value_region' }

end

describe google_compute_network_firewall_policy(name: 'value_name', project: 'chef-gcp-inspec') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_network_firewall_policy` resource:


  * `kind`: [Output only] Type of the resource. Always compute#firewallPolicyfor firewall policies

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. For Organization Firewall Policies it's a [Output Only] numeric ID allocated by Google Cloud which uniquely identifies the Organization Firewall Policy.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `rules`: A list of rules that belong to this policy. There must always be a default rule (rule with priority 2147483647 and match "*"). If no rules are provided when creating a firewall policy, a default rule with action "allow" will be added.

    * `kind`: [Output only] Type of the resource. Always compute#firewallPolicyRule for firewall policy rules

    * `rule_name`: An optional name for the rule. This field is not a unique identifier and can be updated.

    * `description`: An optional description for this resource.

    * `priority`: An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.

    * `match`: Represents a match condition that incoming traffic is evaluated against. Exactly one field must be specified.

      * `src_ip_ranges`: CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 5000.

      * `dest_ip_ranges`: CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 5000.

      * `layer4_configs`: Pairs of IP protocols and ports that the rule should match.

        * `ip_protocol`: The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.

        * `ports`: An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"].

      * `src_secure_tags`: List of secure tag values, which should be matched at the source of the traffic. For INGRESS rule, if all the srcSecureTag are INEFFECTIVE, and there is no srcIpRange, this rule will be ignored. Maximum number of source tag values allowed is 256.

        * `name`: Name of the secure tag, created with TagManager's TagValue API.

        * `state`: [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted.
        Possible values:
          * EFFECTIVE
          * INEFFECTIVE

      * `dest_address_groups`: Address groups which should be matched against the traffic destination. Maximum number of destination address groups is 10.

      * `src_address_groups`: Address groups which should be matched against the traffic source. Maximum number of source address groups is 10.

      * `src_fqdns`: Fully Qualified Domain Name (FQDN) which should be matched against traffic source. Maximum number of source fqdn allowed is 100.

      * `dest_fqdns`: Fully Qualified Domain Name (FQDN) which should be matched against traffic destination. Maximum number of destination fqdn allowed is 100.

      * `src_region_codes`: Region codes whose IP addresses will be used to match for source of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of source region codes allowed is 5000.

      * `dest_region_codes`: Region codes whose IP addresses will be used to match for destination of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of dest region codes allowed is 5000.

      * `dest_threat_intelligences`: Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic destination.

      * `src_threat_intelligences`: Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic source.

    * `action`: The Action to perform when the client connection triggers the rule. Valid actions are "allow", "deny" and "goto_next".

    * `direction`: The direction in which this rule applies.
    Possible values:
      * EGRESS
      * INGRESS

    * `target_resources`: A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule.

    * `enable_logging`: Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules.

    * `rule_tuple_count`: [Output Only] Calculation of the complexity of a single firewall policy rule.

    * `target_service_accounts`: A list of service accounts indicating the sets of instances that are applied with this rule.

    * `target_secure_tags`: A list of secure tags that controls which instances the firewall rule applies to. If targetSecureTag are specified, then the firewall rule applies only to instances in the VPC network that have one of those EFFECTIVE secure tags, if all the target_secure_tag are in INEFFECTIVE state, then this rule will be ignored. targetSecureTag may not be set at the same time as targetServiceAccounts. If neither targetServiceAccounts nor targetSecureTag are specified, the firewall rule applies to all instances on the specified network. Maximum number of target label tags allowed is 256.

      * `name`: Name of the secure tag, created with TagManager's TagValue API.

      * `state`: [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted.
      Possible values:
        * EFFECTIVE
        * INEFFECTIVE

    * `disabled`: Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled.

  * `fingerprint`: Specifies a fingerprint for this resource, which is essentially a hash of the metadata's contents and used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update metadata. You must always provide an up-to-date fingerprint hash in order to update or change metadata, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make get() request to the firewall policy.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `associations`: A list of associations that belong to this firewall policy.

    * `name`: The name for an association.

    * `attachment_target`: The target that the firewall policy is attached to.

    * `firewall_policy_id`: [Output Only] The firewall policy ID of the association.

    * `short_name`: [Output Only] The short name of the firewall policy of the association.

    * `display_name`: [Output Only] Deprecated, please use short name instead. The display name of the firewall policy of the association.

  * `rule_tuple_count`: [Output Only] Total count of all firewall policy rule tuples. A firewall policy can not exceed a set number of tuples.

  * `short_name`: User-provided name of the Organization firewall policy. The name should be unique in the organization in which the firewall policy is created. This field is not applicable to network firewall policies. This name must be set on creation and cannot be changed. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `display_name`: Deprecated, please use short name instead. User-provided name of the Organization firewall policy. The name should be unique in the organization in which the firewall policy is created. This field is not applicable to network firewall policies. This name must be set on creation and cannot be changed. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `parent`: [Output Only] The parent of the firewall policy. This field is not applicable to network firewall policies.

  * `region`: [Output Only] URL of the region where the regional firewall policy resides. This field is not applicable to global firewall policies. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
