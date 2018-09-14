# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/admin_directory_v1'

module Inspec::Resources
  class GoogleUser < GcpResourceBase
    name 'google_user'
    desc 'Verifies settings for a GCP user'

    example "
      describe google_user(user_key: '110491234567894702010') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:user_key]
      catch_gcp_errors do
        @user = @gcp.gcp_admin_client.get_user(opts[:user_key])
        create_resource_methods(@user)
      end
    end

    def exists?
      !@user.nil?
    end

    def suspended?
      return false if !defined?(@user.suspended)
      @user.suspended
    end

    def has_mfa_enabled?
      return false if !defined?(@user.is_enrolled_in2_sv)
      @user.is_enrolled_in2_sv
    end

    def to_s
      "User #{@display_name}"
    end
  end
end
