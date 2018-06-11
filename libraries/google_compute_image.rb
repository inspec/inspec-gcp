# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeImage < GcpResourceBase
    name 'google_compute_image'
    desc 'Verifies settings for an image'

    example "
      describe google_compute_image(project: 'chef-inspec-gcp', name: 'image-1') do
        it { should exist }
        its('name') { should eq 'image-1' }
        its('source_type') { should eq 'RAW' }
        its('family') { should eq 'inspec-test-family' }
        its('status') { should eq 'ready' }
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      # there's a little extra complication here because we might want to retrieve a project custom image, or
      # the latest image that is part of an image family
      begin
        @image = @gcp.gcp_compute_client.get_image(opts[:project], opts[:name])
        create_resource_methods(@image)
      rescue Google::Apis::ClientError
        # if the above is not successful try to get the image from an image family before giving up
        # Note: this will swallow the previous exception but allows to preserve parity with the single
        # google_compute_image tf resource
        catch_gcp_errors do
          @image = @gcp.gcp_compute_client.get_image_from_family(opts[:project], opts[:name])
          create_resource_methods(@image)
        end
      end
    end

    def exists?
      !@image.nil?
    end

    def to_s
      "Image #{@display_name}"
    end
  end
end
