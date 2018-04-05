# frozen_string_literal: true

# author: Martez Reed

require 'google/apis'
require 'google/apis/cloudresourcemanager_v1'
require 'google/apis/compute_v1'
require 'google/apis/storage_v1'
require 'google/apis/iam_v1'
require 'googleauth'

class GCPConnection
  def initialize
    # gcp_credential_file = ENV['GOOGLE_APPLICATION_CREDENTIALS']

    # if gcp_credential_file.nil?
    #   warn format('The GCP credentials environment variable is not set.')
    #   exit(1)
    # end

    # Check to see if the credentials file exists
    # if File.file?(gcp_credential_file)
    #   warn format('%s was not found or not accessible', gcp_credential_file)
    # end

    scopes = ['https://www.googleapis.com/auth/cloud-platform',
              'https://www.googleapis.com/auth/compute']
    authorization = Google::Auth.get_application_default(scopes)
    Google::Apis::RequestOptions.default.authorization = authorization
  end

  def compute_client
    @compute_client ||= Google::Apis::ComputeV1::ComputeService.new
  end

  def iam_client
    @iam_client ||= Google::Apis::IamV1::IamService.new
  end

  def project_client
    @project_client ||= Google::Apis::CloudresourcemanagerV1::CloudResourceManagerService.new
  end

  def storage_client
    @storage_client ||= Google::Apis::StorageV1::StorageService.new
  end
end
