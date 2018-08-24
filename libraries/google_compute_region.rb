# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeRegion < GcpResourceBase
    name 'google_compute_region'
    desc 'Verifies settings for a region'

    example "
      describe google_compute_region(project: 'chef-inspec-gcp',  region: 'europe-west2') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @region = @gcp.gcp_compute_client.get_region(opts[:project], opts[:name])
        create_resource_methods(@region)
      end
    end

    # helper for returning a list of zone short names rather than fully qualified URLs e.g.
    #   https://www.googleapis.com/compute/v1/projects/spaterson-project/zones/asia-east1-a
    def zone_names
      return false if !defined?(@region.zones)
      @region.zones.map {|zone| zone.split('/').last }
    end

    def exists?
      !@region.nil?
    end

    def up?
      return false if !defined?(status)
      status == 'UP'
    end

    def to_s
      "Region #{@display_name}"
    end
  end
end
