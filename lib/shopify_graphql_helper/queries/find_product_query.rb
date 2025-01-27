# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindProductQuery
      QUERY = <<~QUERY
        query GetProduct($id: ID!) {
          product(id: $id) {
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
                preview {
                  image {
                    id
                    url
                  }
                }
              }
            }
            variants(first: 10) {
              nodes {
                id
                legacyResourceId
                inventoryQuantity
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
            collections(first: 10) {
              nodes {
                id
                title
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
