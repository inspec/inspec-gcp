# frozen_string_literal: true

# TODO: Determine if next like is required

# require "inspec/resource"

module InspecPlugins::GcpResources
  # This class will provide the actual CLI implementation.
  # Its superclass is provided by another call to Inspec.plugin,
  # this time with two args.  The first arg specifies we are requesting
  # version 2 of the Plugins API.  The second says we are making a Resource
  # Pack plugin component, so please make available any DSL needed
  # for that.
  class ResourcePack < Inspec.plugin(2, :resource_pack)
  end
end
