# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class UpdateProductMutation
      MUTATION = <<~GRAPHQL
        mutation($input: ProductInput!) {
          productUpdate(input: $input) {
            product {
              id
              title
            }
            userErrors {
              field
              message
            }
          }
        }
      GRAPHQL

      def self.mutation
        MUTATION
      end
    end
  end
end
