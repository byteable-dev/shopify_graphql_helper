# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductCreateMutation
      MUTATION = <<~QUERY
        mutation ProductCreate($product: ProductCreateInput!, $media: [CreateMediaInput!]) {
          productCreate(product: $product, media: $media) {
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
              variants(first:3){
                nodes{
                  id
                  sku
                  price
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
