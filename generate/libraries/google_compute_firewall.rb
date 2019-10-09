# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
require 'google/compute/property/firewall_allowed'
require 'google/compute/property/firewall_denied'

# A provider to manage Compute Engine resources.
class ComputeFirewall < GcpResourceBase
  name 'google_compute_firewall'
  desc 'Firewall'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :allowed
  attr_reader :creation_timestamp
  attr_reader :denied
  attr_reader :description
  attr_reader :destination_ranges
  attr_reader :direction
  attr_reader :disabled
  attr_reader :id
  attr_reader :name
  attr_reader :network
  attr_reader :priority
  attr_reader :source_ranges
  attr_reader :source_service_accounts
  attr_reader :source_tags
  attr_reader :target_service_accounts
  attr_reader :target_tags

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @allowed = GoogleInSpec::Compute::Property::FirewallAllowedArray.parse(@fetched['allowed'], to_s)
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @denied = GoogleInSpec::Compute::Property::FirewallDeniedArray.parse(@fetched['denied'], to_s)
    @description = @fetched['description']
    @destination_ranges = @fetched['destinationRanges']
    @direction = @fetched['direction']
    @disabled = @fetched['disabled']
    @id = @fetched['id']
    @name = @fetched['name']
    @network = @fetched['network']
    @priority = @fetched['priority']
    @source_ranges = @fetched['sourceRanges']
    @source_service_accounts = @fetched['sourceServiceAccounts']
    @source_tags = @fetched['sourceTags']
    @target_service_accounts = @fetched['targetServiceAccounts']
    @target_tags = @fetched['targetTags']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Firewall #{@params[:name]}"
  end

  def un_parse
    {
      'allowed' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('allowed') { should include '#{single.to_json}' }" } },
      'creation_timestamp' => ->(x, _) { x.nil? ? [] : ["its('creation_timestamp.to_s') { should cmp '#{x.inspect}' }"] },
      'denied' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('denied') { should include '#{single.to_json}' }" } },
      'description' => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      'destination_ranges' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('destination_ranges') { should include #{single.inspect} }" } },
      'direction' => ->(x, _) { x.nil? ? [] : ["its('direction') { should cmp #{x.inspect} }"] },
      'disabled' => ->(x, _) { x.nil? ? [] : ["its('disabled') { should cmp #{x.inspect} }"] },
      'id' => ->(x, _) { x.nil? ? [] : ["its('id') { should cmp #{x.inspect} }"] },
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'network' => ->(x, _) { x.nil? ? [] : ["its('network') { should cmp #{x.inspect} }"] },
      'priority' => ->(x, _) { x.nil? ? [] : ["its('priority') { should cmp #{x.inspect} }"] },
      'source_ranges' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('source_ranges') { should include #{single.inspect} }" } },
      'source_service_accounts' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('source_service_accounts') { should include #{single.inspect} }" } },
      'source_tags' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('source_tags') { should include #{single.inspect} }" } },
      'target_service_accounts' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('target_service_accounts') { should include #{single.inspect} }" } },
      'target_tags' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('target_tags') { should include #{single.inspect} }" } },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'Firewall'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_compute_firewall',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/firewalls/{{name}}'
  end
end