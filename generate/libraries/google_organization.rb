# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleOrganization < GcpResourceBase
    name 'google_organization'
    desc 'Verifies settings for an organization'

    example "
      describe google_organization(name: 'google.com') do
        it { should exist }
        its('name') { should eq 'organizations/1234' }
        its('display_name') { should eq 'google.com' }
        its('lifecycle_state') { should eq 'ACTIVE' }
      end
    "
    def initialize(opts = {})
      super(opts)
      @display_name = opts[:name] || opts[:display_name]
      catch_gcp_errors do
        @organization = @gcp.gcp_project_client.get_organization(opts[:name])
        create_resource_methods(@organization)
      end
    end

    def label_value_by_key(label_key)
      return [] if !defined?(labels) || labels.nil?
      labels.item[label_key]
    end

    def exists?
      !@organization.nil?
    end

    def to_s
      "Organization #{@display_name}"
    end
  end
end
