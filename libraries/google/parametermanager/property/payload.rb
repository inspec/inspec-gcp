# frozen_string_literal: true

module GoogleInSpec
  module ParameterManager
    module Property
      class Payload
        attr_reader :data

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @data = args['data']
        end

        def to_s
          "#{@parent_identifier} PolicyMember"
        end
      end
    end
  end
end
