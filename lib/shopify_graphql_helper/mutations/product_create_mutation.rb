# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductCreateMutation
      MUTATION = <<~QUERY
        mutation ProductCreate($input: ProductInput!) {
          productCreate(input: $input) {
            product {
              id
              title
              options {
                id
                name
                position
                optionValues {
                  id
                  name
                  hasVariants
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
