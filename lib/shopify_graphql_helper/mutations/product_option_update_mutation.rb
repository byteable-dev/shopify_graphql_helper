module ShopifyGraphqlHelper
  module Mutations
    class ProductOptionUpdateMutation
      MUTATION = <<~QUERY
        mutation updateOption($productId: ID!, $option: OptionUpdateInput!, $optionValuesToAdd: [OptionValueCreateInput!], $optionValuesToUpdate: [OptionValueUpdateInput!], $optionValuesToDelete: [ID!], $variantStrategy: ProductOptionUpdateVariantStrategy) {
          productOptionUpdate(productId: $productId, option: $option, optionValuesToAdd: $optionValuesToAdd, optionValuesToUpdate: $optionValuesToUpdate, optionValuesToDelete: $optionValuesToDelete, variantStrategy: $variantStrategy) {
            userErrors {
              field
              message
              code
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
              variants(first: 5) {
                nodes {
                  id
                  title
                  selectedOptions {
                    name
                    value
                  }
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
