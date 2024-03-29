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
module GoogleInSpec
  module KMS
    module Property
      class EkmConnectionServiceResolversServerCertificates
        attr_reader :raw_der

        attr_reader :parsed

        attr_reader :issuer

        attr_reader :subject

        attr_reader :subject_alternative_dns_names

        attr_reader :not_before_time

        attr_reader :not_after_time

        attr_reader :serial_number

        attr_reader :sha256_fingerprint

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @raw_der = args['rawDer']
          @parsed = args['parsed']
          @issuer = args['issuer']
          @subject = args['subject']
          @subject_alternative_dns_names = args['subjectAlternativeDnsNames']
          @not_before_time = parse_time_string(args['notBeforeTime'])
          @not_after_time = parse_time_string(args['notAfterTime'])
          @serial_number = args['serialNumber']
          @sha256_fingerprint = args['sha256Fingerprint']
        end

        def to_s
          "#{@parent_identifier} EkmConnectionServiceResolversServerCertificates"
        end

        # Handles parsing RFC3339 time string
        def parse_time_string(time_string)
          time_string ? Time.parse(time_string) : nil
        end
      end
    end
  end
end
