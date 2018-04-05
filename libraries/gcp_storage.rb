# frozen_string_literal: true

require 'json'

class GcpStorage < Inspec.resource(1)
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

  def initialize(opts, conn = GCPConnection.new)
    @opts = opts
    @display_name = @opts[:name]
    @storage_client = conn.storage_client
    begin
      @bucket = @storage_client.get_bucket(@opts[:name])
    rescue => e
      @error = JSON.parse(e.body)
    end
  end

  # def has_bucket_label?(label_name)
  #   if @bucket
  #     labels = @bucket.labels.items
  #     labels.each do |label|
  #       if label == label_name
  #         break
  #       end
  #     end
  #   else
  #     @error['error']['message']
  #     false
  #   end
  #   return false
  # end

  def name
    if @bucket
      @bucket.name.to_s.downcase
    else
      @error['error']['message']
    end
  end

  def kind
    if @bucket
      @bucket.kind
    else
      @error['error']['message']
    end
  end

  def project_number
    if @bucket
      @bucket.project_number.to_s
    else
      @error['error']['message']
    end
  end

  def location
    if @bucket
      @bucket.location.to_s.downcase
    else
      @error['error']['message']
    end
  end

  def lifecycle
    if @bucket.lifecycle.nil?
      'disabled'
    else
      'enabled'
    end
  end

  def storage_class
    if @bucket
      @bucket.storage_class.to_s.downcase
    else
      @error['error']['message']
    end
  end

  def exists?
    !@bucket.nil?
  end

  def to_s
    "Bucket #{@display_name}"
  end
end
