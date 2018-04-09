# frozen_string_literal: true

require 'gcp_backend'

class GcpImageCustom < GcpResourceBase
  name 'gcp_image_custom'
  desc 'Verifies settings for a custom image'

  example "
    describe gcp_image_custom(project: 'silicon-vertex-398188',name: 'image-1') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('source_type') { should eq 'RAW' }
      its('family') { should eq 'inspec-test-family' }
      its('status') { should eq 'ready' }
    end
  "
  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      @image = @gcp.compute_client.get_image(opts[:project], opts[:name])
      create_resource_methods(@image)
    end
  end

  def to_s
    "Image #{@display_name}"
  end
end
