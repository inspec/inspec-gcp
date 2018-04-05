# frozen_string_literal: true

require 'json'

class GcpProject < Inspec.resource(1)
  name 'gcp_project'
  desc 'Verifies settings for a project'

  example "
    describe gcp_project('silicon-vertex-398188') do
      it { should exist }
      its('name') { should eq 'My First Project' }
      its('project_number') { should eq '3934801284823' }
      its('lifecycle_state') { should eq 'ACTIVE' }
      its('labels') { should include(key: 'contact', value: 'operations') }
    end
  "

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @project_client = conn.project_client
    begin
      @project = @project_client.get_project(@opts)
    rescue => e
      @error = JSON.parse(e.body)
    end
  end

  def project_number
    if @project
      @project.project_number.to_s
    else
      @error['error']['message']
    end
  end

  def create_time
    if @project
      @project.create_time
    else
      @error['error']['message']
    end
  end

  def labels
    if @project
      @labels ||= @project.labels.map { |k, v| { key: k, value: v } }
    else
      @error['error']['message']
    end
  end

  def lifecycle_state
    if @project
      @project.lifecycle_state
    else
      @error['error']['message']
    end
  end

  def exists?
    !@project.nil?
  end

  def name
    if @project
      @project.name
    else
      @error['error']['message']
    end
  end

  def to_s
    "Project #{@display_name}"
  end
end
