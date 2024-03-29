# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_certificate_paths'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config_call_credentials'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config_call_credentials_from_plugin'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config_channel_credentials'
require 'google/compute/property/regionsslpolicy_tls_settings_proxy_tls_context_certificate_context_sds_config_grpc_service_config_channel_credentials_certificates'
module GoogleInSpec
  module Compute
    module Property
      class RegionSslPolicyTlsSettingsProxyTlsContextCertificateContext
        attr_reader :certificate_source

        attr_reader :certificate_paths

        attr_reader :sds_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @certificate_source = args['certificateSource']
          @certificate_paths = GoogleInSpec::Compute::Property::RegionSslPolicyTlsSettingsProxyTlsContextCertificateContextCertificatePaths.new(args['certificatePaths'], to_s)
          @sds_config = GoogleInSpec::Compute::Property::RegionSslPolicyTlsSettingsProxyTlsContextCertificateContextSdsConfig.new(args['sdsConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionSslPolicyTlsSettingsProxyTlsContextCertificateContext"
        end
      end
    end
  end
end
