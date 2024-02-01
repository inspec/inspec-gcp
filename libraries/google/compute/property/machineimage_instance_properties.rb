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
require 'google/compute/property/machineimage_instance_properties_advanced_machine_features'
require 'google/compute/property/machineimage_instance_properties_confidential_instance_config'
require 'google/compute/property/machineimage_instance_properties_disks'
require 'google/compute/property/machineimage_instance_properties_guest_accelerators'
require 'google/compute/property/machineimage_instance_properties_labels'
require 'google/compute/property/machineimage_instance_properties_metadata'
require 'google/compute/property/machineimage_instance_properties_metadata_items'
require 'google/compute/property/machineimage_instance_properties_network_interfaces'
require 'google/compute/property/machineimage_instance_properties_network_performance_config'
require 'google/compute/property/machineimage_instance_properties_reservation_affinity'
require 'google/compute/property/machineimage_instance_properties_resource_manager_tags'
require 'google/compute/property/machineimage_instance_properties_scheduling'
require 'google/compute/property/machineimage_instance_properties_scheduling_local_ssd_recovery_timeout'
require 'google/compute/property/machineimage_instance_properties_scheduling_node_affinities'
require 'google/compute/property/machineimage_instance_properties_service_accounts'
require 'google/compute/property/machineimage_instance_properties_shielded_instance_config'
require 'google/compute/property/machineimage_instance_properties_tags'
module GoogleInSpec
  module Compute
    module Property
      class MachineImageInstanceProperties
        attr_reader :description

        attr_reader :tags

        attr_reader :resource_manager_tags

        attr_reader :machine_type

        attr_reader :can_ip_forward

        attr_reader :network_interfaces

        attr_reader :disks

        attr_reader :metadata

        attr_reader :service_accounts

        attr_reader :scheduling

        attr_reader :labels

        attr_reader :guest_accelerators

        attr_reader :min_cpu_platform

        attr_reader :reservation_affinity

        attr_reader :shielded_instance_config

        attr_reader :resource_policies

        attr_reader :confidential_instance_config

        attr_reader :private_ipv6_google_access

        attr_reader :advanced_machine_features

        attr_reader :network_performance_config

        attr_reader :key_revocation_action_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @description = args['description']
          @tags = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesTags.new(args['tags'], to_s)
          @resource_manager_tags = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesResourceManagerTags.new(args['resourceManagerTags'], to_s)
          @machine_type = args['machineType']
          @can_ip_forward = args['canIpForward']
          @network_interfaces = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesNetworkInterfacesArray.parse(args['networkInterfaces'], to_s)
          @disks = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesDisksArray.parse(args['disks'], to_s)
          @metadata = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesMetadata.new(args['metadata'], to_s)
          @service_accounts = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesServiceAccountsArray.parse(args['serviceAccounts'], to_s)
          @scheduling = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesScheduling.new(args['scheduling'], to_s)
          @labels = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesLabels.new(args['labels'], to_s)
          @guest_accelerators = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesGuestAcceleratorsArray.parse(args['guestAccelerators'], to_s)
          @min_cpu_platform = args['minCpuPlatform']
          @reservation_affinity = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesReservationAffinity.new(args['reservationAffinity'], to_s)
          @shielded_instance_config = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesShieldedInstanceConfig.new(args['shieldedInstanceConfig'], to_s)
          @resource_policies = args['resourcePolicies']
          @confidential_instance_config = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesConfidentialInstanceConfig.new(args['confidentialInstanceConfig'], to_s)
          @private_ipv6_google_access = args['privateIpv6GoogleAccess']
          @advanced_machine_features = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesAdvancedMachineFeatures.new(args['advancedMachineFeatures'], to_s)
          @network_performance_config = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesNetworkPerformanceConfig.new(args['networkPerformanceConfig'], to_s)
          @key_revocation_action_type = args['keyRevocationActionType']
        end

        def to_s
          "#{@parent_identifier} MachineImageInstanceProperties"
        end
      end
    end
  end
end