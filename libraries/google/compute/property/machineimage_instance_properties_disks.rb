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
require 'google/compute/property/machineimage_instance_properties_disks_disk_encryption_key'
require 'google/compute/property/machineimage_instance_properties_disks_guest_os_features'
require 'google/compute/property/machineimage_instance_properties_disks_initialize_params'
require 'google/compute/property/machineimage_instance_properties_disks_initialize_params_labels'
require 'google/compute/property/machineimage_instance_properties_disks_initialize_params_resource_manager_tags'
require 'google/compute/property/machineimage_instance_properties_disks_initialize_params_source_image_encryption_key'
require 'google/compute/property/machineimage_instance_properties_disks_initialize_params_source_snapshot_encryption_key'
require 'google/compute/property/machineimage_instance_properties_disks_shielded_instance_initial_state'
require 'google/compute/property/machineimage_instance_properties_disks_shielded_instance_initial_state_dbs'
require 'google/compute/property/machineimage_instance_properties_disks_shielded_instance_initial_state_dbxs'
require 'google/compute/property/machineimage_instance_properties_disks_shielded_instance_initial_state_keks'
require 'google/compute/property/machineimage_instance_properties_disks_shielded_instance_initial_state_pk'
module GoogleInSpec
  module Compute
    module Property
      class MachineImageInstancePropertiesDisks
        attr_reader :kind

        attr_reader :type

        attr_reader :mode

        attr_reader :saved_state

        attr_reader :source

        attr_reader :device_name

        attr_reader :index

        attr_reader :boot

        attr_reader :initialize_params

        attr_reader :auto_delete

        attr_reader :licenses

        attr_reader :interface

        attr_reader :guest_os_features

        attr_reader :disk_encryption_key

        attr_reader :disk_size_gb

        attr_reader :shielded_instance_initial_state

        attr_reader :force_attach

        attr_reader :architecture

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @kind = args['kind']
          @type = args['type']
          @mode = args['mode']
          @saved_state = args['savedState']
          @source = args['source']
          @device_name = args['deviceName']
          @index = args['index']
          @boot = args['boot']
          @initialize_params = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesDisksInitializeParams.new(args['initializeParams'], to_s)
          @auto_delete = args['autoDelete']
          @licenses = args['licenses']
          @interface = args['interface']
          @guest_os_features = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesDisksGuestOsFeaturesArray.parse(args['guestOsFeatures'], to_s)
          @disk_encryption_key = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesDisksDiskEncryptionKey.new(args['diskEncryptionKey'], to_s)
          @disk_size_gb = args['diskSizeGb']
          @shielded_instance_initial_state = GoogleInSpec::Compute::Property::MachineImageInstancePropertiesDisksShieldedInstanceInitialState.new(args['shieldedInstanceInitialState'], to_s)
          @force_attach = args['forceAttach']
          @architecture = args['architecture']
        end

        def to_s
          "#{@parent_identifier} MachineImageInstancePropertiesDisks"
        end
      end

      class MachineImageInstancePropertiesDisksArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return MachineImageInstancePropertiesDisks.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| MachineImageInstancePropertiesDisks.new(v, parent_identifier) }
        end
      end
    end
  end
end
