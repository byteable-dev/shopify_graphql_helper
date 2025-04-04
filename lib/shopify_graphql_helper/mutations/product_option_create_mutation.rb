module ShopifyGraphqlHelper
  module Mutations
    class ProductOptionCreateMutation
      MUTATION = <<~QUERY
        mutation createOptions($productId: ID!, $options: [OptionCreateInput!]!) {
          productOptionsCreate(productId: $productId, options: $options) {
            userErrors {
              field
              message
              code
            }
            product {
              options {
                name
                linkedMetafield {
                  namespace
                  key
                }
                optionValues {
                  name
                  linkedMetafieldValue
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
