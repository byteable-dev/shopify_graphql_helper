# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ProductsQuery
      QUERY = <<~QUERY
        query($numProducts: Int!, $cursor: String) {
          products(first: $numProducts, after: $cursor) {
            nodes {
              id
              title
              tags
              variants(first:10) {
                nodes {
                  id
                  title
                  displayName
                  sku
                  price
                  compareAtPrice
                  inventoryItem{
                    id
                    inventoryLevels(first: 100) {
                      nodes {
                        location{
                          id
                        }
                        quantities(names: "available"){
                          name
                          quantity
                        }
                      }
                    }
                  }
                }
              }
              collections(first: 10, query: "collection_type:smart OR collection_type:custom"){
                nodes {
                  id
                  title
                }
              }
            }
            pageInfo{
              hasPreviousPage
              hasNextPage
              startCursor
              endCursor
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
