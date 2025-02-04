# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductVariantCreateMutation
      MUTATION = <<~QUERY
        mutation CreateProductVariantWithMedia($input: ProductVariantInput!) {
          productVariantCreate(input: $input) {
            product {
              id
            }
            productVariant {
              id
              title
              media(first: 10) {
                nodes {
                  id
                  alt
                  mediaContentType
                  preview {
                    status
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
