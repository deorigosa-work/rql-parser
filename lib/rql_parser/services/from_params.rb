# frozen_string_literal: true

module RqlParser
  module Services
    # Creates a RQL binary tree directly from params hash
    class FromParams < BaseInteraction
      hash :params, strip: false

      def execute
        perform(Parse.run(rql: rql))
      end

      private

      def rql
        params.except(:controller, :action).map do |k, v|
          [k, v].compact.join('=')
        end.join('&')
      end
    end
  end
end
