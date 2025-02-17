# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchProductVariants
      QUERY = <<~QUERY
        query($query: String!) {
          productVariants(first: 1, query: $query) {
            edges {
              node {
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
                media(first: 10){
                  nodes{
                    id
                    alt
                    mediaContentType
                    preview {
                      image {
                        id
                        url
                      }
                    }
                  }
                }
                metafields(first: 20){
                  nodes{
                    id
                    legacyResourceId
                    key
                    value
                    type
                    namespace
                    ownerType
                    description
                    jsonValue
                  }
                }
                product{
                  id
                  options(first: 20) {
                    id
                    position
                    name
                    values
                    optionValues {
                      id
                      name
                      hasVariants
                    }
                  }
                }
                inventoryItem{
                  id
                  inventoryLevels(first: 100) {
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
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
