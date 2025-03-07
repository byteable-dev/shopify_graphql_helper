# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ProductUpdateMutation
      MUTATION = <<~QUERY
        mutation ProductUpdate($input: ProductInput!, $media: [CreateMediaInput!]) {
          productUpdate(input: $input, media: $media) {
            product {
              id
              title
              descriptionHtml
              tags
              publishedAt
              handle
              productType
              vendor
              status
              templateSuffix
              media(first: 10) {
                nodes {
                  alt
                  mediaContentType
                  preview {
                    status
                  }
                }
              }
              variants(first: 10) {
                nodes {
                  id
                  legacyResourceId
                  inventoryQuantity
                  inventoryPolicy
                  title
                  displayName
                  sku
                  barcode
                  price
                  compareAtPrice
                  selectedOptions{
                    name
                    value
                    optionValue{
                      id
                      name
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
