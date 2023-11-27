# frozen_string_literal: false

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectIAMBindings < GcpResourceBase
    name 'google_project_iam_bindings'
    desc 'Verifies settings for GCP project iam_bindings in bulk'

    example "
      describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
        it { should exist }
        ...
      end
    "
    attr_reader :params
    attr_reader :table

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @params = params
      @project = params[:project]
      @iam_binding_exists = false
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Post')
      parse unless @fetched.nil?
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :table)

    def parse
      iam_binding_rows = []
      @bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)
      return [] if !@bindings
      @bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @iam_binding_exists=true
      @table = iam_binding_rows
    end

    def exists?
      @iam_binding_exists
    end

    def to_s
      "Project IAM Binding #{@role}"
    end

    private

    def product_url
      'https://cloudresourcemanager.googleapis.com/v1/'
    end

    def resource_base_url
      'projects/{{project}}:getIamPolicy'
    end
  end
end
