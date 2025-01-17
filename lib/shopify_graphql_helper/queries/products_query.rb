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
                  product {
                    id
                  }
                }
              }
              collections(first: 50, query: "collection_type:smart OR collection_type:custom"){
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
