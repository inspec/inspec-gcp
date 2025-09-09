+++
title = "google_compute_region_security_policy Resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"


[menu.gcp]
title = "google_compute_region_security_policy"
identifier = "inspec/resources/gcp/google_compute_region_security_policy Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_security_policy` InSpec audit resource to test the properties of a Google Cloud RegionSecurityPolicy resource.

## Examples

```ruby
describe google_compute_region_security_policy(project: 'chef-gcp-inspec', region: ' ', securityPolicy: ' ') do
	it { should exist }
	its('kind') { should cmp '' }
	its('id') { should cmp '' }
	its('creation_timestamp') { should cmp '' }
	its('name') { should cmp '' }
	its('description') { should cmp '' }
	its('fingerprint') { should cmp '' }
	its('self_link') { should cmp '' }
	its('self_link_with_id') { should cmp '' }
	its('type') { should cmp '' }
	its('label_fingerprint') { should cmp '' }
	its('display_name') { should cmp '' }
	its('parent') { should cmp '' }
	its('region') { should cmp '' }

end

describe google_compute_region_security_policy(project: 'chef-gcp-inspec', region: ' ', securityPolicy: ' ') do
	it { should_not exist }
end
```

## Parameters

Parameters that can be accessed from the `google_compute_region_security_policy` resource:

## Properties

Properties that can be accessed from the `google_compute_region_security_policy` resource:


  * `user_defined_fields`: Definitions of user-defined fields for CLOUD_ARMOR_NETWORK policies. A user-defined field consists of up to 4 bytes extracted from a fixed offset in the packet, relative to the IPv4, IPv6, TCP, or UDP header, with an optional mask to select certain bits. Rules may then specify matching values for these fields. Example: userDefinedFields: - name: "ipv4_fragment_offset" base: IPV4 offset: 6 size: 2 mask: "0x1fff"

    * `name`: The name of this field. Must be unique within the policy.

    * `base`: The base relative to which 'offset' is measured. Possible values are: - IPV4: Points to the beginning of the IPv4 header. - IPV6: Points to the beginning of the IPv6 header. - TCP: Points to the beginning of the TCP header, skipping over any IPv4 options or IPv6 extension headers. Not present for non-first fragments. - UDP: Points to the beginning of the UDP header, skipping over any IPv4 options or IPv6 extension headers. Not present for non-first fragments. required
    Possible values:
      * IPV4
      * IPV6
      * TCP
      * UDP

    * `offset`: Offset of the first byte of the field (in network byte order) relative to 'base'.

    * `size`: Size of the field in bytes. Valid values: 1-4.

    * `mask`: If specified, apply this mask (bitwise AND) to the field to ignore bits before matching. Encoded as a hexadecimal number (starting with "0x"). The last byte of the field (in network byte order) corresponds to the least significant byte of the mask.

  * `kind`: [Output only] Type of the resource. Always compute#securityPolicyfor security policies

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `rules`: A list of rules that belong to this policy. There must always be a default rule which is a rule with priority 2147483647 and match all condition (for the match condition this means match "*" for srcIpRanges and for the networkMatch condition every field must be either match "*" or not set). If no rules are provided when creating a security policy, a default rule with action "allow" will be added.

    * `kind`: [Output only] Type of the resource. Always compute#securityPolicyRule for security policy rules

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `priority`: An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority.

    * `match`: Represents a match condition that incoming traffic is evaluated against. Exactly one field must be specified.

      * `expr`: Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: "Summary size limit" description: "Determines if a summary is less than 100 chars" expression: "document.summary.size() < 100" Example (Equality): title: "Requestor is owner" description: "Determines if requestor is the document owner" expression: "document.owner == request.auth.claims.email" Example (Logic): title: "Public documents" description: "Determine whether the document should be publicly visible" expression: "document.type != 'private' && document.type != 'internal'" Example (Data Manipulation): title: "Notification string" description: "Create a notification string with a timestamp." expression: "'New message received at ' + string(document.create_time)" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information.

        * `expression`: Textual representation of an expression in Common Expression Language syntax.

        * `title`: Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.

        * `description`: Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.

        * `location`: Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.

      * `expr_options`: 

        * `recaptcha_options`: 

          * `action_token_site_keys`: A list of site keys to be used during the validation of reCAPTCHA action-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created.

          * `session_token_site_keys`: A list of site keys to be used during the validation of reCAPTCHA session-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created.

      * `versioned_expr`: Preconfigured versioned expression. If this field is specified, config must also be specified. Available preconfigured expressions along with their requirements are: SRC_IPS_V1 - must specify the corresponding src_ip_range field in config.
      Possible values:
        * FIREWALL
        * SRC_IPS_V1

      * `config`: 

        * `src_ip_ranges`: CIDR IP address range. Maximum number of src_ip_ranges allowed is 10.

        * `dest_ip_ranges`: CIDR IP address range. This field may only be specified when versioned_expr is set to FIREWALL.

        * `dest_ports`: Pairs of IP protocols and ports that the rule should match. This field may only be specified when versioned_expr is set to FIREWALL.

          * `ip_protocol`: The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.

          * `ports`: An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. This field may only be specified when versioned_expr is set to FIREWALL.

        * `layer4_configs`: Pairs of IP protocols and ports that the rule should match. This field may only be specified when versioned_expr is set to FIREWALL.

          * `ip_protocol`: The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.

          * `ports`: An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. This field may only be specified when versioned_expr is set to FIREWALL.

    * `network_match`: Represents a match condition that incoming network traffic is evaluated against.

      * `user_defined_fields`: User-defined fields. Each element names a defined field and lists the matching values for that field.

        * `name`: Name of the user-defined field, as given in the definition.

        * `values`: Matching values of the field. Each element can be a 32-bit unsigned decimal or hexadecimal (starting with "0x") number (e.g. "64") or range (e.g. "0x400-0x7ff").

      * `src_ip_ranges`: Source IPv4/IPv6 addresses or CIDR prefixes, in standard text format.

      * `dest_ip_ranges`: Destination IPv4/IPv6 addresses or CIDR prefixes, in standard text format.

      * `ip_protocols`: IPv4 protocol / IPv6 next header (after extension headers). Each element can be an 8-bit unsigned decimal number (e.g. "6"), range (e.g. "253-254"), or one of the following protocol names: "tcp", "udp", "icmp", "esp", "ah", "ipip", or "sctp".

      * `src_ports`: Source port numbers for TCP/UDP/SCTP. Each element can be a 16-bit unsigned decimal number (e.g. "80") or range (e.g. "0-1023").

      * `dest_ports`: Destination port numbers for TCP/UDP/SCTP. Each element can be a 16-bit unsigned decimal number (e.g. "80") or range (e.g. "0-1023").

      * `src_region_codes`: Two-letter ISO 3166-1 alpha-2 country code associated with the source IP address.

      * `src_asns`: BGP Autonomous System Number associated with the source IP address.

    * `action`: The Action to perform when the rule is matched. The following are the valid actions: - allow: allow access to target. - deny(STATUS): deny access to target, returns the HTTP response code specified. Valid values for `STATUS` are 403, 404, and 502. - rate_based_ban: limit client traffic to the configured threshold and ban the client if the traffic exceeds the threshold. Configure parameters for this action in RateLimitOptions. Requires rate_limit_options to be set. - redirect: redirect to a different target. This can either be an internal reCAPTCHA redirect, or an external URL-based redirect via a 302 response. Parameters for this action can be configured via redirectOptions. This action is only supported in Global Security Policies of type CLOUD_ARMOR. - throttle: limit client traffic to the configured threshold. Configure parameters for this action in rateLimitOptions. Requires rate_limit_options to be set for this. 

    * `preview`: If set to true, the specified action is not enforced.

    * `direction`: The direction in which this rule applies. This field may only be specified when versioned_expr is set to FIREWALL.
    Possible values:
      * EGRESS
      * INGRESS

    * `target_resources`: A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule. This field may only be specified when versioned_expr is set to FIREWALL.

    * `enable_logging`: Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules. This field may only be specified when the versioned_expr is set to FIREWALL.

    * `rule_tuple_count`: [Output Only] Calculation of the complexity of a single firewall security policy rule.

    * `rate_limit_options`: 

      * `rate_limit_threshold`: 

        * `count`: Number of HTTP(S) requests for calculating the threshold.

        * `interval_sec`: Interval over which the threshold is computed.

      * `conform_action`: Action to take for requests that are under the configured rate limit threshold. Valid option is "allow" only.

      * `exceed_action`: Action to take for requests that are above the configured rate limit threshold, to either deny with a specified HTTP response code, or redirect to a different endpoint. Valid options are `deny(STATUS)`, where valid values for `STATUS` are 403, 404, 429, and 502, and `redirect`, where the redirect parameters come from `exceedRedirectOptions` below. The `redirect` action is only supported in Global Security Policies of type CLOUD_ARMOR.

      * `exceed_redirect_options`: 

        * `type`: Type of the redirect action.
        Possible values:
          * EXTERNAL_302
          * GOOGLE_RECAPTCHA

        * `target`: Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA.

      * `exceed_action_rpc_status`: Simplified google.rpc.Status type (omitting details).

        * `code`: The status code, which should be an enum value of google.rpc.Code.

        * `message`: A developer-facing error message, which should be in English.

      * `enforce_on_key`: Determines the key to enforce the rate_limit_threshold on. Possible values are: - ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKey" is not configured. - IP: The source IP address of the request is the key. Each IP has this limit enforced separately. - HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. - XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. - HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. - HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes. - SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session. - REGION_CODE: The country/region from which the request originates. - TLS_JA3_FINGERPRINT: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. - USER_IP: The IP address of the originating client, which is resolved based on "userIpRequestHeaders" configured with the security policy. If there is no "userIpRequestHeaders" configuration or an IP address cannot be resolved from it, the key type defaults to IP. 
      Possible values:
        * ALL
        * ALL_IPS
        * HTTP_COOKIE
        * HTTP_HEADER
        * HTTP_PATH
        * IP
        * REGION_CODE
        * SNI
        * TLS_JA3_FINGERPRINT
        * USER_IP
        * XFF_IP

      * `enforce_on_key_name`: Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value.

      * `enforce_on_key_configs`: If specified, any combination of values of enforce_on_key_type/enforce_on_key_name is treated as the key on which ratelimit threshold/action is enforced. You can specify up to 3 enforce_on_key_configs. If enforce_on_key_configs is specified, enforce_on_key must not be specified.

        * `enforce_on_key_type`: Determines the key to enforce the rate_limit_threshold on. Possible values are: - ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKeyConfigs" is not configured. - IP: The source IP address of the request is the key. Each IP has this limit enforced separately. - HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. - XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. - HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. - HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes. - SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session. - REGION_CODE: The country/region from which the request originates. - TLS_JA3_FINGERPRINT: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. - USER_IP: The IP address of the originating client, which is resolved based on "userIpRequestHeaders" configured with the security policy. If there is no "userIpRequestHeaders" configuration or an IP address cannot be resolved from it, the key type defaults to IP. 
        Possible values:
          * ALL
          * ALL_IPS
          * HTTP_COOKIE
          * HTTP_HEADER
          * HTTP_PATH
          * IP
          * REGION_CODE
          * SNI
          * TLS_JA3_FINGERPRINT
          * USER_IP
          * XFF_IP

        * `enforce_on_key_name`: Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value.

      * `ban_threshold`: 

        * `count`: Number of HTTP(S) requests for calculating the threshold.

        * `interval_sec`: Interval over which the threshold is computed.

      * `ban_duration_sec`: Can only be specified if the action for the rule is "rate_based_ban". If specified, determines the time (in seconds) the traffic will continue to be banned by the rate limit after the rate falls below the threshold.

    * `target_service_accounts`: A list of service accounts indicating the sets of instances that are applied with this rule.

    * `rule_number`: Identifier for the rule. This is only unique within the given security policy. This can only be set during rule creation, if rule number is not specified it will be generated by the server.

    * `redirect_target`: This must be specified for redirect actions. Cannot be specified for any other actions.

    * `header_action`: 

      * `request_headers_to_adds`: The list of request headers to add or overwrite if they're already present.

        * `header_name`: The name of the header to set.

        * `header_value`: The value to set the named header to.

    * `redirect_options`: 

      * `type`: Type of the redirect action.
      Possible values:
        * EXTERNAL_302
        * GOOGLE_RECAPTCHA

      * `target`: Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA.

    * `rule_managed_protection_tier`: [Output Only] The minimum managed protection tier required for this rule. [Deprecated] Use requiredManagedProtectionTiers instead.
    Possible values:
      * CAMP_PLUS_ANNUAL
      * CAMP_PLUS_PAYGO
      * CA_STANDARD

    * `preconfigured_waf_config`: 

      * `exclusions`: A list of exclusions to apply during preconfigured WAF evaluation.

        * `target_rule_set`: Target WAF rule set to apply the preconfigured WAF exclusion.

        * `target_rule_ids`: A list of target rule IDs under the WAF rule set to apply the preconfigured WAF exclusion. If omitted, it refers to all the rule IDs under the WAF rule set.

        * `request_headers_to_exclude`: A list of request header names whose value will be excluded from inspection during preconfigured WAF evaluation.

          * `val`: The value of the field.

          * `op`: The match operator for the field.
          Possible values:
            * CONTAINS
            * ENDS_WITH
            * EQUALS
            * EQUALS_ANY
            * STARTS_WITH

        * `request_cookies_to_exclude`: A list of request cookie names whose value will be excluded from inspection during preconfigured WAF evaluation.

          * `val`: The value of the field.

          * `op`: The match operator for the field.
          Possible values:
            * CONTAINS
            * ENDS_WITH
            * EQUALS
            * EQUALS_ANY
            * STARTS_WITH

        * `request_query_params_to_exclude`: A list of request query parameter names whose value will be excluded from inspection during preconfigured WAF evaluation. Note that the parameter can be in the query string or in the POST body.

          * `val`: The value of the field.

          * `op`: The match operator for the field.
          Possible values:
            * CONTAINS
            * ENDS_WITH
            * EQUALS
            * EQUALS_ANY
            * STARTS_WITH

        * `request_uris_to_exclude`: A list of request URIs from the request line to be excluded from inspection during preconfigured WAF evaluation. When specifying this field, the query or fragment part should be excluded.

          * `val`: The value of the field.

          * `op`: The match operator for the field.
          Possible values:
            * CONTAINS
            * ENDS_WITH
            * EQUALS
            * EQUALS_ANY
            * STARTS_WITH

  * `cloud_armor_config`: Configuration options for Cloud Armor.

    * `enable_ml`: If set to true, enables Cloud Armor Machine Learning.

  * `adaptive_protection_config`: Configuration options for Cloud Armor Adaptive Protection (CAAP).

    * `layer7_ddos_defense_config`: Configuration options for L7 DDoS detection. This field is only supported in Global Security Policies of type CLOUD_ARMOR.

      * `enable`: If set to true, enables CAAP for L7 DDoS detection. This field is only supported in Global Security Policies of type CLOUD_ARMOR.

      * `rule_visibility`: Rule visibility can be one of the following: STANDARD - opaque rules. (default) PREMIUM - transparent rules. This field is only supported in Global Security Policies of type CLOUD_ARMOR.
      Possible values:
        * PREMIUM
        * STANDARD

      * `threshold_configs`: Configuration options for layer7 adaptive protection for various customizable thresholds.

        * `name`: The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the security policy.

        * `auto_deploy_load_threshold`: 

        * `auto_deploy_confidence_threshold`: 

        * `auto_deploy_impacted_baseline_threshold`: 

        * `auto_deploy_expiration_sec`: 

        * `detection_load_threshold`: 

        * `detection_absolute_qps`: 

        * `detection_relative_to_baseline_qps`: 

        * `traffic_granularity_configs`: Configuration options for enabling Adaptive Protection to operate on specified granular traffic units.

          * `type`: Type of this configuration.
          Possible values:
            * HTTP_HEADER_HOST
            * HTTP_PATH
            * UNSPECIFIED_TYPE

          * `value`: Requests that match this value constitute a granular traffic unit.

          * `enable_each_unique_value`: If enabled, traffic matching each unique value for the specified type constitutes a separate traffic unit. It can only be set to true if `value` is empty.

    * `auto_deploy_config`: Configuration options for Adaptive Protection auto-deploy feature.

      * `load_threshold`: 

      * `confidence_threshold`: 

      * `impacted_baseline_threshold`: 

      * `expiration_sec`: 

  * `ddos_protection_config`: 

    * `ddos_protection`: 
    Possible values:
      * ADVANCED
      * ADVANCED_PREVIEW
      * STANDARD

  * `advanced_options_config`: 

    * `json_parsing`: 
    Possible values:
      * DISABLED
      * STANDARD
      * STANDARD_WITH_GRAPHQL

    * `json_custom_config`: 

      * `content_types`: A list of custom Content-Type header values to apply the JSON parsing. As per RFC 1341, a Content-Type header value has the following format: Content-Type := type "/" subtype *[";" parameter] When configuring a custom Content-Type header value, only the type/subtype needs to be specified, and the parameters should be excluded.

    * `log_level`: 
    Possible values:
      * NORMAL
      * VERBOSE

    * `user_ip_request_headers`: An optional list of case-insensitive request header names to use for resolving the callers client IP address.

  * `recaptcha_options_config`: 

    * `redirect_site_key`: An optional field to supply a reCAPTCHA site key to be used for all the rules using the redirect action with the type of GOOGLE_RECAPTCHA under the security policy. The specified site key needs to be created from the reCAPTCHA API. The user is responsible for the validity of the specified site key. If not specified, a Google-managed site key is used. This field is only supported in Global Security Policies of type CLOUD_ARMOR.

  * `fingerprint`: Specifies a fingerprint for this resource, which is essentially a hash of the metadata's contents and used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update metadata. You must always provide an up-to-date fingerprint hash in order to update or change metadata, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make get() request to the security policy.

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `type`: The type indicates the intended use of the security policy. - CLOUD_ARMOR: Cloud Armor backend security policies can be configured to filter incoming HTTP requests targeting backend services. They filter requests before they hit the origin servers. - CLOUD_ARMOR_EDGE: Cloud Armor edge security policies can be configured to filter incoming HTTP requests targeting backend services (including Cloud CDN-enabled) as well as backend buckets (Cloud Storage). They filter requests before the request is served from Google's cache. - CLOUD_ARMOR_INTERNAL_SERVICE: Cloud Armor internal service policies can be configured to filter HTTP requests targeting services managed by Traffic Director in a service mesh. They filter requests before the request is served from the application. - CLOUD_ARMOR_NETWORK: Cloud Armor network policies can be configured to filter packets targeting network load balancing resources such as backend services, target pools, target instances, and instances with external IPs. They filter requests before the request is served from the application. This field can be set only at resource creation time.
  Possible values:
    * CLOUD_ARMOR
    * CLOUD_ARMOR_EDGE
    * CLOUD_ARMOR_INTERNAL_SERVICE
    * CLOUD_ARMOR_NETWORK
    * FIREWALL

  * `associations`: A list of associations that belong to this policy.

    * `name`: The name for an association.

    * `attachment_id`: The resource that the security policy is attached to.

    * `security_policy_id`: [Output Only] The security policy ID of the association.

    * `display_name`: [Output Only] The display name of the security policy of the association.

  * `labels`: Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty.

    * `additional_properties`: 

  * `label_fingerprint`: A fingerprint for the labels being applied to this security policy, which is essentially a hash of the labels set used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update labels. You must always provide an up-to-date fingerprint hash in order to update or change labels. To see the latest fingerprint, make get() request to the security policy.

  * `rule_tuple_count`: [Output Only] Total count of all security policy rule tuples. A security policy can not exceed a set number of tuples.

  * `display_name`: User-provided name of the organization security policy. The name should be unique in the organization in which the security policy is created. This should only be used when SecurityPolicyType is FIREWALL. The name must be 1-63 characters long, and comply with https://www.ietf.org/rfc/rfc1035.txt. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `parent`: [Output Only] The parent of the security policy.

  * `region`: [Output Only] URL of the region where the regional security policy resides. This field is not applicable to global security policies.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
