module GoogleInSpec
  module ParameterManager
    module Property
      class PolicyMember
        attr_reader :iam_policy_uid_principal

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @iam_policy_uid_principal = args['iamPolicyUidPrincipal']
        end

        def to_s
          "#{@parent_identifier} PolicyMember"
        end
      end
    end
  end
end
