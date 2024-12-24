# frozen_string_literal: true

module ShopifyGraphqlHelper
  class Mutations
    class UpdateOrderMetafieldsMutation
      MUTATION = <<~QUERY
        mutation updateOrderMetafields($input: OrderInput!) {
          orderUpdate(input: $input) {
            order {
              id
              metafields(first: 5) {
                edges {
                  node {
                    id
                    namespace
                    key
                    value
                  }
                }
              }
            }
            userErrors {
              message
              field
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
