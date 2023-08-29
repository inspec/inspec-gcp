---
title: About the google_compute_region_security_policy resource
platform: gcp
---

## Syntax
A `google_compute_region_security_policy` is used to test a Google RegionSecurityPolicy resource

## Examples
```
      describe google_compute_region_security_policy(name: ' ') do
     it { should exist }
   end
```

## Properties
Properties that can be accessed from the `google_compute_region_security_policy` resource:


  * `kind`: [Output only] Type of the resource. Always compute#securityPolicyfor security policies 

  * `id`: string (uint64 format) The unique identifier for the resource. This identifier is defined by the server. 

  * `creation_timestamp`: Creation timestamp in RFC3339 text format. 

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. 

  * `description`: An optional description of this resource. Provide this property when you create the resource. 

  * `rules`: object A list of rules that belong to this policy. There must always be a default rule which is a rule with priority 2147483647 and match all condition (for the match condition this means match "*" for srcIpRanges and for the networkMatch condition every field must be either match "*" or not set). If no rules are provided when creating a security policy, a default rule with action "allow" will be added. 

    * `kind`: [Output only] Type of the resource. Always compute#securityPolicyRule for security policy rules 

    * `description`: An optional description of this resource. Provide this property when you create the resource. 

    * `priority`: integer An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority. 

    * `match`: object A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. 

      * `expr`: object User defined CEVAL expression. A CEVAL expression is used to specify match criteria such as origin.ip, source.region_code and contents in the request header. Expressions containing evaluateThreatIntelligence require Cloud Armor Managed Protection Plus tier and are not supported in Edge Policies nor in Regional Policies. Expressions containing evaluatePreconfiguredExpr('sourceiplist-*') require Cloud Armor Managed Protection Plus tier and are only supported in Global Security Policies. 

        * `expression`: Textual representation of an expression in Common Expression Language syntax. 

        * `title`: Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. 

        * `description`: Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. 

        * `location`: Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. 

      * `versioned_expr`: Preconfigured versioned expression. If this field is specified, config must also be specified. Available preconfigured expressions along with their requirements are: SRC_IPS_V1 - must specify the corresponding srcIpRange field in config. 
      Possible values:
        * SRC_IPS_V1

      * `config`: object The configuration options available when specifying versionedExpr. This field must be specified if versionedExpr is specified and cannot be specified if versionedExpr is not specified. 

        * `src_ip_ranges`: CIDR IP address range. Maximum number of srcIpRanges allowed is 10. 

    * `action`: The Action to perform when the rule is matched. The following are the valid actions:  allow: allow access to target. deny(STATUS): deny access to target, returns the HTTP response code specified. Valid values for STATUS are 403, 404, and 502. rate_based_ban: limit client traffic to the configured threshold and ban the client if the traffic exceeds the threshold. Configure parameters for this action in RateLimitOptions. Requires rateLimitOptions to be set. redirect: redirect to a different target. This can either be an internal reCAPTCHA redirect, or an external URL-based redirect via a 302 response. Parameters for this action can be configured via redirectOptions. This action is only supported in Global Security Policies of type CLOUD_ARMOR. throttle: limit client traffic to the configured threshold. Configure parameters for this action in rateLimitOptions. Requires rateLimitOptions to be set for this. 

    * `preview`: boolean If set to true, the specified action is not enforced. 

    * `rate_limit_options`: object Must be specified if the action is "rate_based_ban" or "throttle". Cannot be specified for any other actions. 

      * `rate_limit_threshold`: object Threshold at which to begin ratelimiting. 

        * `count`: integer Number of HTTP(S) requests for calculating the threshold. 

        * `interval_sec`: integer Interval over which the threshold is computed. 

      * `conform_action`: Action to take for requests that are under the configured rate limit threshold. Valid option is "allow" only. 

      * `exceed_action`: Action to take for requests that are above the configured rate limit threshold, to either deny with a specified HTTP response code, or redirect to a different endpoint. Valid options are deny(STATUS), where valid values for STATUS are 403, 404, 429, and 502, and redirect, where the redirect parameters come from exceedRedirectOptions below. The redirect action is only supported in Global Security Policies of type CLOUD_ARMOR. 

      * `exceed_redirect_options`: object Parameters defining the redirect action that is used as the exceed action. Cannot be specified if the exceed action is not redirect. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 

        * `type`: Type of the redirect action. 
        Possible values:
          * VALUE_1

        * `target`: Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA. 

      * `enforce_on_key`: Determines the key to enforce the rateLimitThreshold on. Possible values are:  ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKey" is not configured. IP: The source IP address of the request is the key. Each IP has this limit enforced separately. HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes.  SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session.  REGION_CODE: The country/region from which the request originates. 
      Possible values:
        * ALL
        * A
        * IP
        * IP
        * IP
        * HTTP_HEADER
        * HTTP
        * 128
        * ALL
        * XFF_IP
        * IP
        * IP
        * X
        * HTTP
        * IP
        * IP
        * IP
        * HTTP_COOKIE
        * HTTP
        * 128
        * ALL
        * HTTP_PATH
        * URL
        * HTTP
        * 128
        * SNI
        * TLS
        * HTTPS
        * 128
        * ALL
        * HTTP
        * REGION_CODE

      * `enforce_on_key_name`: Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value. 

      * `enforce_on_key_configs`: object If specified, any combination of values of enforceOnKeyType/enforceOnKeyName is treated as the key on which ratelimit threshold/action is enforced. You can specify up to 3 enforceOnKeyConfigs. If enforceOnKeyConfigs is specified, enforceOnKey must not be specified. 

        * `enforce_on_key_type`: Determines the key to enforce the rateLimitThreshold on. Possible values are:  ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKeyConfigs" is not configured. IP: The source IP address of the request is the key. Each IP has this limit enforced separately. HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes.  SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session.  REGION_CODE: The country/region from which the request originates. 
        Possible values:
          * ALL
          * A
          * IP
          * IP
          * IP
          * HTTP_HEADER
          * HTTP
          * 128
          * ALL
          * XFF_IP
          * IP
          * IP
          * X
          * HTTP
          * IP
          * IP
          * IP
          * HTTP_COOKIE
          * HTTP
          * 128
          * ALL
          * HTTP_PATH
          * URL
          * HTTP
          * 128
          * SNI
          * TLS
          * HTTPS
          * 128
          * ALL
          * HTTP
          * REGION_CODE

        * `enforce_on_key_name`: Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value. 

      * `ban_threshold`: object Can only be specified if the action for the rule is "rate_based_ban". If specified, the key will be banned for the configured 'banDurationSec' when the number of requests that exceed the 'rateLimitThreshold' also exceed this 'banThreshold'. 

        * `count`: integer Number of HTTP(S) requests for calculating the threshold. 

        * `interval_sec`: integer Interval over which the threshold is computed. 

      * `ban_duration_sec`: integer Can only be specified if the action for the rule is "rate_based_ban". If specified, determines the time (in seconds) the traffic will continue to be banned by the rate limit after the rate falls below the threshold. 

    * `header_action`: object Optional, additional actions that are performed on headers. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 

      * `request_headers_to_adds`: object The list of request headers to add or overwrite if they're already present. 

        * `header_name`: The name of the header to set. 

        * `header_value`: The value to set the named header to. 

    * `redirect_options`: object Parameters defining the redirect action. Cannot be specified for any other actions. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 

      * `type`: Type of the redirect action. 
      Possible values:
        * VALUE_1

      * `target`: Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA. 

    * `preconfigured_waf_config`: object Preconfigured WAF configuration to be applied for the rule. If the rule does not evaluate preconfigured WAF rules, i.e., if evaluatePreconfiguredWaf() is not used, this field will have no effect. 

      * `exclusions`: object A list of exclusions to apply during preconfigured WAF evaluation. 

        * `target_rule_set`: Target WAF rule set to apply the preconfigured WAF exclusion. 

        * `target_rule_ids`: A list of target rule IDs under the WAF rule set to apply the preconfigured WAF exclusion. If omitted, it refers to all the rule IDs under the WAF rule set. 

        * `request_headers_to_exclude`: object A list of request header names whose value will be excluded from inspection during preconfigured WAF evaluation. 

          * `val`: The value of the field. 

          * `op`: The match operator for the field. 
          Possible values:
            * VALUE_1

        * `request_cookies_to_exclude`: object A list of request cookie names whose value will be excluded from inspection during preconfigured WAF evaluation. 

          * `val`: The value of the field. 

          * `op`: The match operator for the field. 
          Possible values:
            * VALUE_1

        * `request_query_params_to_exclude`: object A list of request query parameter names whose value will be excluded from inspection during preconfigured WAF evaluation. Note that the parameter can be in the query string or in the POST body. 

          * `val`: The value of the field. 

          * `op`: The match operator for the field. 
          Possible values:
            * VALUE_1

        * `request_uris_to_exclude`: object A list of request URIs from the request line to be excluded from inspection during preconfigured WAF evaluation. When specifying this field, the query or fragment part should be excluded. 

          * `val`: The value of the field. 

          * `op`: The match operator for the field. 
          Possible values:
            * VALUE_1

  * `adaptive_protection_config`: object 

    * `layer7_ddos_defense_config`: object If set to true, enables Cloud Armor Machine Learning. 

      * `enable`: boolean If set to true, enables CAAP for L7 DDoS detection. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 

      * `rule_visibility`: Rule visibility can be one of the following: STANDARD - opaque rules. (default) PREMIUM - transparent rules. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 
      Possible values:
        * STANDARD
        * PREMIUM
        * CLOUD_ARMOR

      * `threshold_configs`: object Configuration options for layer7 adaptive protection for various customizable thresholds. 

        * `name`: The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the security policy. 

        * `auto_deploy_load_threshold`: number 

        * `auto_deploy_confidence_threshold`: number 

        * `auto_deploy_impacted_baseline_threshold`: number 

        * `auto_deploy_expiration_sec`: integer 

  * `ddos_protection_config`: object 

    * `ddos_protection`: 
    Possible values:
      * VALUE_1

  * `advanced_options_config`: object 

    * `json_parsing`: 
    Possible values:
      * VALUE_1

    * `json_custom_config`: object Custom configuration to apply the JSON parsing. Only applicable when jsonParsing is set to STANDARD. 

      * `content_types`: A list of custom Content-Type header values to apply the JSON parsing. As per RFC 1341, a Content-Type header value has the following format: Content-Type := type "/" subtype *[";" parameter] When configuring a custom Content-Type header value, only the type/subtype needs to be specified, and the parameters should be excluded. 

    * `log_level`: 
    Possible values:
      * VALUE_1

  * `recaptcha_options_config`: object 

    * `redirect_site_key`: An optional field to supply a reCAPTCHA site key to be used for all the rules using the redirect action with the type of GOOGLE_RECAPTCHA under the security policy. The specified site key needs to be created from the reCAPTCHA API. The user is responsible for the validity of the specified site key. If not specified, a Google-managed site key is used. This field is only supported in Global Security Policies of type CLOUD_ARMOR. 

  * `fingerprint`: string (bytes format) Specifies a fingerprint for this resource, which is essentially a hash of the metadata's contents and used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update metadata. You must always provide an up-to-date fingerprint hash in order to update or change metadata, otherwise the request will fail with error 412 conditionNotMet. To see the latest fingerprint, make get() request to the security policy. A base64-encoded string. 

  * `self_link`: Server-defined URL for the resource. 

  * `type`: The type indicates the intended use of the security policy.  CLOUD_ARMOR: Cloud Armor backend security policies can be configured to filter incoming HTTP requests targeting backend services. They filter requests before they hit the origin servers. CLOUD_ARMOR_EDGE: Cloud Armor edge security policies can be configured to filter incoming HTTP requests targeting backend services (including Cloud CDN-enabled) as well as backend buckets (Cloud Storage). They filter requests before the request is served from Google's cache. CLOUD_ARMOR_INTERNAL_SERVICE: Cloud Armor internal service policies can be configured to filter HTTP requests targeting services managed by Traffic Director in a service mesh. They filter requests before the request is served from the application.  CLOUD_ARMOR_NETWORK: Cloud Armor network policies can be configured to filter packets targeting network load balancing resources such as backend services, target pools, target instances, and instances with external IPs. They filter requests before the request is served from the application.  This field can be set only at resource creation time. 
  Possible values:
    * CLOUD_ARMOR
    * HTTP
    * CLOUD_ARMOR_EDGE
    * HTTP
    * CDN
    * CLOUD_ARMOR_INTERNAL_SERVICE
    * HTTP
    * CLOUD_ARMOR_NETWORK

  * `labels`: map (key: string, value: string) Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty. 

    * `string`: 

  * `label_fingerprint`: string (bytes format) A fingerprint for the labels being applied to this security policy, which is essentially a hash of the labels set used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update labels. You must always provide an up-to-date fingerprint hash in order to update or change labels. To see the latest fingerprint, make get() request to the security policy. A base64-encoded string. 

  * `region`: URL of the region where the regional security policy resides. This field is not applicable to global security policies. 


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
