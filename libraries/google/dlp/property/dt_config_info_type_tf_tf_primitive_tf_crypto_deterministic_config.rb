

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
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_context"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_crypto_key"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_crypto_key_kms_wrapped"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_crypto_key_transient"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_crypto_key_unwrapped"
require "google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_crypto_deterministic_config_surrogate_info_type"
module GoogleInSpec
  module DLP
    module Property
      class DTConfigInfoTypeTfTfPrimitiveTfCryptoDeterministicConfig
        attr_reader :crypto_key

        attr_reader :surrogate_info_type

        attr_reader :context

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @crypto_key = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfCryptoDeterministicConfigCryptoKey.new(args["cryptoKey"], to_s)
          @surrogate_info_type = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfCryptoDeterministicConfigSurrogateInfoType.new(args["surrogateInfoType"], to_s)
          @context = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfCryptoDeterministicConfigContext.new(args["context"], to_s)
        end

        def to_s
          "#{@parent_identifier} DTConfigInfoTypeTfTfPrimitiveTfCryptoDeterministicConfig"
        end
      end
    end
  end
end
