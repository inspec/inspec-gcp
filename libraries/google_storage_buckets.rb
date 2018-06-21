# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBuckets < GcpResourceBase
    name 'google_storage_buckets'
    desc 'Verifies settings for GCP storage buckets in bulk'

    example "
      describe google_storage_buckets(project: 'chef-inspec-gcp') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:bucket_ids, field: :bucket_id)
    filter_table_config.add(:bucket_names, field: :bucket_name)
    filter_table_config.add(:bucket_project_numbers, field: :bucket_project_number)
    filter_table_config.add(:bucket_locations, field: :bucket_location)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      bucket_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @buckets = @gcp.gcp_storage_client.list_buckets(@project, page_token: next_page)
        end
        return [] if !@buckets || !@buckets.items
        @buckets.items.map do |bucket|
          bucket_rows+=[{ bucket_id: bucket.id,
                          bucket_name: bucket.name,
                          bucket_project_number: bucket.project_number,
                          bucket_location: bucket.location }]
        end
        next_page = @buckets.next_page_token
        break unless next_page
      end
      @table = bucket_rows
    end
  end
end
