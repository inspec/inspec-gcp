# frozen_string_literal: true

require 'gcp_backend'

class GcpFirewallRule < GcpResourceBase
  name 'gcp_firewall_rule'
  desc 'Verifies settings for a compute firewall rule'

  example "
    describe gcp_firewall_rule(project: 'chef-inspec-gcp', location: 'us-west2', name: 'gcp-inspec-test') do
      it { should exist }
      its('name') { should eq 'inspec-test' }
      its('status') { should eq 'in_use' }
      ...
    end
  "
  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      @firewall = @gcp.compute_client.get_firewall(opts[:project], opts[:name])
      create_resource_methods(@firewall)
    end
  end

  # Check whether the firewall rule allows HTTP access (tcp ingress on port 80)
  def allowed_http?
    ports_protocol_allowed(['80'])
  end

  # Check whether the firewall rule allows SSH access (tcp ingress on port 22)
  def allowed_ssh?
    ports_protocol_allowed(['22'])
  end

  def ports_protocol_allowed(port_list, protocol = 'tcp', index = 0)
    if defined?(allowed[index].item[:ip_protocol])
      # so here we know at least there's some protocol/port to check
      return false if allowed[index].item[:ip_protocol]!=protocol
      # we know there's only one port in the list but let's assume in the future there could be several ports and order doesn't matter
      return false if allowed[index].item[:ports].sort!=port_list.sort
      true
    else
      false
    end
  end

  def to_s
    "Firewall Rule #{@display_name}"
  end
end
