# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class StagedUploadCreateMutation
      MUTATION = <<~QUERY
        mutation stagedUploadsCreate($input: [StagedUploadInput!]!) {
          stagedUploadsCreate(input: $input) {
            stagedTargets {
              url
              resourceUrl
              parameters {
                name
                value
              }
            }
            userErrors{
              field
              message
            }
          }
        }
      QUERY

      def self.mutation
        MUTATION
      end
    end
  end
end
