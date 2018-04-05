# frozen_string_literal: true

require 'json'

class GcpAddress < Inspec.resource(1)
  name 'gcp_address'
  desc 'Verifies settings for a compute address'

  example "
    describe gcp_address(project: 'chef-inspec-gcp', location: 'us-west2', name: 'gcp-inspec-test') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('status') { should eq 'in_use' }
      ...
    end
  "

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @display_name = @opts[:name]
    @address_client = conn.compute_client
    begin
      @address = @address_client.get_address(@opts[:project], @opts[:location], @opts[:name])
    rescue => e
      @error = JSON.parse(e.body)
    end
  end

  def address_id
    if @address
      @address.id.to_s
    else
      @error['error']['message']
    end
  end

  def address_ip
    if @address
      @address.address.to_s
    else
      @error['error']['message']
    end
  end

  def address_ip_exists
    if @address
      !@address.address.nil?
    else
      @error['error']['message']
    end
  end

  def region
    if @address
      @address.region.to_s.split('/').last
    else
      @error['error']['message']
    end
  end

  def kind
    if @address
      @address.kind
    else
      @error['error']['message']
    end
  end

  def name
    if @address
      @address.name
    else
      @error['error']['message']
    end
  end

  def status
    if @address
      @address.status.downcase
    else
      @error['error']['message']
    end
  end

  def user_count
    if @address
      @address.users.count
    else
      @error['error']['message']
    end
  end

  def user_resource_name
    if @address
      @address.users[0].split('/').last
    else
      @error['error']['message']
    end
  end

  def exists?
    !@address.nil?
  end

  def to_s
    "Address #{@display_name}"
  end
end
