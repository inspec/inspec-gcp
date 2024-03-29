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
require 'google/secretmanager/property/secret_replication_user_managed_replicas_customer_managed_encryption'
module GoogleInSpec
  module SecretManager
    module Property
      class SecretReplicationUserManagedReplicas
        attr_reader :location

        attr_reader :customer_managed_encryption

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @location = args['location']
          @customer_managed_encryption = GoogleInSpec::SecretManager::Property::SecretReplicationUserManagedReplicasCustomerManagedEncryption.new(args['customerManagedEncryption'], to_s)
        end

        def to_s
          "#{@parent_identifier} SecretReplicationUserManagedReplicas"
        end
      end

      class SecretReplicationUserManagedReplicasArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return SecretReplicationUserManagedReplicas.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| SecretReplicationUserManagedReplicas.new(v, parent_identifier) }
        end
      end
    end
  end
end
