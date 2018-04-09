# frozen_string_literal: true

require 'gcp_backend'

class GcpIamRole < GcpResourceBase
  name 'gcp_iam_service_account'
  desc 'Verifies settings for a project IAM role'

  example "
    describe gcp_iam_service_account('my-project-id') do
      it { should exist }
      its('stage') { should eq 'GA' }
    end
  "

  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      roles = @gcp.iam_client.list_roles
      roles.roles.each do |role|
        if @display_name == role .title
          @iam_role = @gcp.iam_client.get_role(role.name)
        end
      end
      create_resource_methods(@iam_role)
    end
  end

  def exists?
    !@iam_role.nil?
  end

  def to_s
    "IAM Service Account #{@display_name}"
  end
end
