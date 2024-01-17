# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
require 'google/secretmanager/property/secret_replication'
require 'google/secretmanager/property/secret_replication_user_managed'
require 'google/secretmanager/property/secret_replication_user_managed_replicas'
require 'google/secretmanager/property/secret_rotation'
require 'google/secretmanager/property/secret_topics'

# A provider to manage Secret Manager resources.
class SecretManagerSecret < GcpResourceBase
  name 'google_secret_manager_secret'
  desc 'Secret'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :create_time
  attr_reader :labels
  attr_reader :replication
  attr_reader :topics
  attr_reader :expire_time
  attr_reader :ttl
  attr_reader :rotation
  attr_reader :secret_id

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @create_time = @fetched['createTime']
    @labels = @fetched['labels']
    @replication = GoogleInSpec::SecretManager::Property::SecretReplication.new(@fetched['replication'], to_s)
    @topics = GoogleInSpec::SecretManager::Property::SecretTopicsArray.parse(@fetched['topics'], to_s)
    @expire_time = @fetched['expireTime']
    @ttl = @fetched['ttl']
    @rotation = GoogleInSpec::SecretManager::Property::SecretRotation.new(@fetched['rotation'], to_s)
    @secret_id = @fetched['secretId']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Secret #{@params[:secret_id]}"
  end

  private

  def product_url(_ = nil)
    'https://secretmanager.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/secrets/{{secret_id}}'
  end
end
