# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class SetMetafieldMutation
      MUTATION = <<~QUERY
        mutation MetafieldsSet($metafields: [MetafieldsSetInput!]!) {
          metafieldsSet(metafields: $metafields) {
            metafields {
              key
              namespace
              value
              createdAt
              updatedAt
            }
            userErrors {
              field
              message
              code
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
