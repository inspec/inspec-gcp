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

# A provider to manage Cloud SQL resources.
class SQLDatabase < GcpResourceBase
  name 'google_sql_database'
  desc 'Database'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :charset
  attr_reader :collation
  attr_reader :name
  attr_reader :instance

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @charset = @fetched['charset']
    @collation = @fetched['collation']
    @name = @fetched['name']
    @instance = @fetched['instance']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Database #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://sqladmin.googleapis.com/sql/v1beta4/'
  end

  def resource_base_url
    'projects/{{project}}/instances/{{instance}}/databases/{{name}}'
  end
end
