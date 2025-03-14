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
              descriptionHtml
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
              metafields(first: 20) {
                nodes {
                  id
                  namespace
                  key
                  value
                }
              }
              variants(first:3){
                nodes{
                  id
                  sku
                  price
                  inventoryItem{
                    id
                    inventoryLevels(first: 30) {
                      nodes {
                        location{
                          id
                        }
                        quantities(names: "available") {
                          name
                          quantity
                        }
                      }
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
