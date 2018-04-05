# frozen_string_literal: true

require 'json'

class GcpIamRole < Inspec.resource(1)
  name 'gcp_iam_role'
  desc 'Verifies settings for a project'

  example "
    describe gcp_iam_role('admin') do
      it { should exist }
      its('stage') { should eq 'GA' }
    end
  "

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @iam_client = conn.iam_client
    begin
      roles = @iam_client.list_roles
      roles.roles.each do |role|
        if @display_name == role.title
          @iam_role = @iam_client.get_role(role.name)
        end
      end
    rescue => e
      @error = JSON.parse(e.body)
    end
  end

  def exists?
    !@iam_role.nil?
  end

  def stage
    if @iam_role
      @iam_role.stage
    else
      @error['error']['message']
    end
  end

  def to_s
    "IAM Role #{@display_name}"
  end
end
