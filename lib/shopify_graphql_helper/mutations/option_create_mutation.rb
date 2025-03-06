# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class OptionCreateMutation
      MUTATION = <<~QUERY
        mutation createOptions($productId: ID!, $options: [OptionCreateInput!]!, $variantStrategy: ProductOptionCreateVariantStrategy) {
          productOptionsCreate(productId: $productId, options: $options, variantStrategy: $variantStrategy) {
            userErrors {
              field
              message
              code
            }
            product {
              id
              variants(first: 10) {
                nodes {
                  id
                  title
                  selectedOptions {
                    name
                    value
                  }
                }
              }
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
          }
        }
      QUERY

      def self.mutation
        MUTATION
      end
    end
  end
end
