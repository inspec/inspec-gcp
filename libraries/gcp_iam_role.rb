# frozen_string_literal: true

require 'gcp_backend'

class GcpIamRole < GcpResourceBase
  name 'gcp_iam_role'
  desc 'Verifies settings for a project IAM role'

  example "
    describe gcp_iam_role('admin') do
      it { should exist }
      its('stage') { should eq 'GA' }
    end
  "

  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      p "projects/#{opts[:project]}/roles/#{opts[:name]}"
      @iam_role = @gcp.iam_client.get_role("projects/#{opts[:project]}/roles/#{opts[:name]}")
      create_resource_methods(@iam_role)
    end
  end

  def exists?
    !@iam_role.nil?
  end

  def to_s
    "IAM Role #{@display_name}"
  end
end
