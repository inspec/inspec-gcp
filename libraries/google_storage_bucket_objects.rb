# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleStorageBucketObjects < GcpResourceBase
    name 'google_storage_bucket_objects'
    desc 'Verifies settings for GCP storage bucket objects in bulk'

    example "
      describe google_storage_bucket_objects(bucket: 'bucket-name') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @bucket = opts[:bucket]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:object_names, field: :object_name)
    filter_table_config.add(:object_buckets, field: :object_bucket)
    filter_table_config.add(:object_created_times, field: :object_created_time)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      bucket_object_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @bucket_objects = @gcp.gcp_storage_client.list_objects(@bucket, page_token: next_page)
        end
        return [] if !@bucket_objects || !@bucket_objects.items
        @bucket_objects.items.map do |object|
          bucket_object_rows+=[{ object_name: object.name,
                                 object_bucket: object.bucket,
                                 object_created_time: Time.parse(object.time_created.to_s) }]
        end
        next_page = @bucket_objects.next_page_token
        break unless next_page
      end
      @table = bucket_object_rows
    end
  end
end
