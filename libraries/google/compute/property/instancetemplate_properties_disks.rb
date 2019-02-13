# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
require 'google/compute/property/instancetemplate_properties_disks_disk_encryption_key'
require 'google/compute/property/instancetemplate_properties_disks_initialize_params'
require 'google/compute/property/instancetemplate_properties_disks_initialize_params_source_image_encryption_key'
module GoogleInSpec
  module Compute
    module Property
      class InstanceTemplatePropertiesDisks
        attr_reader :auto_delete

        attr_reader :boot

        attr_reader :device_name

        attr_reader :disk_encryption_key

        attr_reader :index

        attr_reader :initialize_params

        attr_reader :interface

        attr_reader :mode

        attr_reader :source

        attr_reader :type

        def initialize(args = nil)
          return if args.nil?
          @auto_delete = args['autoDelete']
          @boot = args['boot']
          @device_name = args['deviceName']
          @disk_encryption_key = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesDisksDiskEncryptionKey.new(args['diskEncryptionKey'])
          @index = args['index']
          @initialize_params = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesDisksInitializeParams.new(args['initializeParams'])
          @interface = args['interface']
          @mode = args['mode']
          @source = args['source']
          @type = args['type']
        end
      end

      class InstanceTemplatePropertiesDisksArray
        def self.parse(value)
          return if value.nil?
          return InstanceTemplatePropertiesDisks.new(value) unless value.is_a?(::Array)
          value.map { |v| InstanceTemplatePropertiesDisks.new(v) }
        end
      end
    end
  end
end
