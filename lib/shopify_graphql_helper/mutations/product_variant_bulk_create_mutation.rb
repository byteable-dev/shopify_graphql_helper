# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductVariantBulkCreateMutation
      MUTATION = <<~QUERY
        mutation productVariantsBulkCreate($productId: ID!, $variants: [ProductVariantsBulkInput!]!) {
          productVariantsBulkUpdate(productId: $productId, variants: $variants) {
            product {
              id
            }
            productVariants {
              id
              title
              price
              compareAtPrice
            }
            userErrors {
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
