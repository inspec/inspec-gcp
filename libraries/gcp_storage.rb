# frozen_string_literal: true

require 'gcp_backend'

class GcpStorage < GcpResourceBase
  name 'gcp_storage'
  desc 'Verifies settings for a bucket'

  example "
    describe gcp_storage(name: 'inspec-test-bucket') do
      it { should exist }
      its('storage_class') { should eq 'REGIONAL' }
      its('location') { should eq 'US-CENTRAL1' }
      its('lifecycle') { should eq 'enabled' }
    end
  "
  def initialize(opts = {})
    # Call the parent class constructor
    super(opts)
    @display_name = opts[:name]
    catch_gcp_errors do
      @bucket = @gcp.storage_client.get_bucket(opts[:name])
      create_resource_methods(@bucket)
    end
  end

  def exists?
    !@bucket.nil?
  end

  def to_s
    "Bucket #{@display_name}"
  end
end
