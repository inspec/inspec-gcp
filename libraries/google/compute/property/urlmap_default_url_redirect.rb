

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
  module Compute
    module Property
      class UrlMapDefaultUrlRedirect
        attr_reader :host_redirect

        attr_reader :https_redirect

        attr_reader :path_redirect

        attr_reader :prefix_redirect

        attr_reader :redirect_response_code

        attr_reader :strip_query

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @host_redirect = args["hostRedirect"]
          @https_redirect = args["httpsRedirect"]
          @path_redirect = args["pathRedirect"]
          @prefix_redirect = args["prefixRedirect"]
          @redirect_response_code = args["redirectResponseCode"]
          @strip_query = args["stripQuery"]
        end

        def to_s
          "#{@parent_identifier} UrlMapDefaultUrlRedirect"
        end
      end
    end
  end
end
