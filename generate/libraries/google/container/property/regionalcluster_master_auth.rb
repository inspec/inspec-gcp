

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
require "google/container/property/regionalcluster_master_auth_client_certificate_config"
module GoogleInSpec
  module Container
    module Property
      class RegionalClusterMasterAuth
        attr_reader :arguments

        attr_reader :username

        attr_reader :password

        attr_reader :client_certificate_config

        attr_reader :cluster_ca_certificate

        attr_reader :client_certificate

        attr_reader :client_key

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @username = arguments["username"]
          @password = arguments["password"]
          @client_certificate_config = GoogleInSpec::Container::Property::RegionalClusterMasterAuthClientCertificateConfig.new(arguments["clientCertificateConfig"], to_s)
          @cluster_ca_certificate = arguments["clusterCaCertificate"]
          @client_certificate = arguments["clientCertificate"]
          @client_key = arguments["clientKey"]
        end

        def to_s
          "#{@parent_identifier} RegionalClusterMasterAuth"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "username" => ->(x, path) { x.nil? ? [] : ["its('#{path}.username') { should cmp #{x.inspect} }"] },
            "password" => ->(x, path) { x.nil? ? [] : ["its('#{path}.password') { should cmp #{x.inspect} }"] },
            "client_certificate_config" => ->(x, path) { x.nil? ? [] : GoogleInSpec::Container::Property::RegionalClusterMasterAuthClientCertificateConfig.un_parse(x, "#{path}.client_certificate_config") },
            "cluster_ca_certificate" => ->(x, path) { x.nil? ? [] : ["its('#{path}.cluster_ca_certificate') { should cmp #{x.inspect} }"] },
            "client_certificate" => ->(x, path) { x.nil? ? [] : ["its('#{path}.client_certificate') { should cmp #{x.inspect} }"] },
            "client_key" => ->(x, path) { x.nil? ? [] : ["its('#{path}.client_key') { should cmp #{x.inspect} }"] },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end
    end
  end
end
