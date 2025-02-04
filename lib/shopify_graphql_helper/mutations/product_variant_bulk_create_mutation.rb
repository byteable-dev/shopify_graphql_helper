# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductVariantBulkCreateMutation
      MUTATION = <<~QUERY
        mutation productVariantsBulkCreate($productId: ID!, $strategy: ProductVariantsBulkCreateStrategy, $variants: [ProductVariantsBulkInput!]!) {
          productVariantsBulkCreate(productId: $productId, strategy: $strategy, variants: $variants) {
            userErrors {
              field
              message
            }
            product {
              id
              options {
                id
                name
                values
                position
                optionValues {
                  id
                  name
                  hasVariants
                }
              }
            }
            productVariants {
              id
              title
              selectedOptions {
                name
                value
              }
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
