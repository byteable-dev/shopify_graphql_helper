# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductVariantBulkUpdateMutation
      MUTATION = <<~QUERY
        mutation productVariantsBulkUpdate($productId: ID!, $variants: [ProductVariantsBulkInput!]!) {
          productVariantsBulkUpdate(productId: $productId, variants: $variants) {
            product {
              id
            }
            productVariants {
              id
              title
              price
              compareAtPrice
              metafields(first: 20) {
                nodes {
                  namespace
                  key
                  value
                  definition{
                    type{
                      category
                      name
                      supportedValidations{
                        name
                        type
                      }
                    }
                    validations{
                      name
                      type
                      value
                    }
                  }
                }
              }
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
