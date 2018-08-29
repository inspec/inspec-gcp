# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleServiceAccountKey < GcpResourceBase
    name 'google_service_account_key'
    desc 'Verifies settings for a GCP project service account key'

    example "
      describe google_service_account_key(name: 'projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080' ) do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name].split('/').last
      catch_gcp_errors do
        @sa_key = @gcp.gcp_iam_client.get_project_service_account_key(opts[:name])
        create_resource_methods(@sa_key)
      end
    end

    def exists?
      !@sa_key.nil?
    end

    def to_s
      "Service Account Key #{@display_name}"
    end
  end
end
