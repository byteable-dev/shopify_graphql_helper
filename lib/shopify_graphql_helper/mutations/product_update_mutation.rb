# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductUpdateMutation
      MUTATION = <<~QUERY
        mutation ProductUpdate($input: ProductInput!) {
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
      QUERY

      def self.mutation
        MUTATION
      end
    end
  end
end
