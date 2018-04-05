# frozen_string_literal: true

require 'json'

class GcpImage < Inspec.resource(1)
  name 'gcp_image'
  desc 'Verifies settings for an image'

  example "
    describe gcp_image(project: 'silicon-vertex-398188',name: 'image-1') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('source_type') { should eq 'RAW' }
      its('family') { should eq 'inspec-test-family' }
      its('status') { should eq 'ready' }
    end
  "

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @display_name = @opts[:name]
    @image_client = conn.compute_client
    begin
      @image = @image_client.get_image(@opts[:project], @opts[:name])
    rescue => e
      @image = JSON.parse(e.body)
    end
  end

  def image_id
    if @image
      @image.id.to_s
    else
      @error['error']['message']
    end
  end

  def family
    if @image
      @image.family
    else
      @error['error']['message']
    end
  end

  def name
    if @image
      @image.name
    else
      @error['error']['message']
    end
  end

  def source_image_id
    if @image
      @image.source_image_id
    else
      @error['error']['message']
    end
  end

  def source_type
    if @image
      @image.source_type
    else
      @error['error']['message']
    end
  end

  def status
    if @image
      @image.status.downcase
    else
      @error['error']['message']
    end
  end

  def exists?
    !@image.nil?
  end

  def to_s
    "Image #{@display_name}"
  end
end
