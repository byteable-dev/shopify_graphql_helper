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
              descriptionHtml
              tags
              publishedAt
              handle
              productType
              vendor
              media(first: 20){
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
              variants(first:10) {
                nodes {
                  id
                  legacyResourceId
                  inventoryQuantity
                  title
                  displayName
                  sku
                  barcode
                  price
                  compareAtPrice
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
                  inventoryItem{
                    id
                    legacyResourceId
                    sku
                    unitCost{
                      amount
                      currencyCode
                    }
                  }
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
