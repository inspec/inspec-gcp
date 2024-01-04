

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
module GoogleInSpec
  module Container
    module Property
      class RegionalNodePoolMaxPodsConstraint
        attr_reader :arguments

        attr_reader :max_pods_per_node

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @max_pods_per_node = arguments["maxPodsPerNode"]
        end

        def to_s
          "#{@parent_identifier} RegionalNodePoolMaxPodsConstraint"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            "max_pods_per_node" => ->(x, path) { x.nil? ? [] : ["its('#{path}.max_pods_per_node') { should cmp #{x.inspect} }"] },
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
