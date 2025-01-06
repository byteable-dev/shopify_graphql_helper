# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindProductVariantQuery
      QUERY = <<~QUERY
        query GetProductVariant($id: ID!) {
          productVariant(id: $id) {
            id
            title
            displayName
            sku
            price
            compareAtPrice
            availableForSale
            createdAt
            inventoryItem{
              id
              inventoryLevels(first: 100) {
                nodes {
                  location{
                    id
                  }
                  quantities {
                    name
                    quantity
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
