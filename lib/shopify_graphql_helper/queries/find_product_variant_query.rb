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
            barcode
            price
            compareAtPrice
            availableForSale
            createdAt
            product {
              id
            }
            inventoryItem{
              id
              legacyResourceId
              sku
              unitCost{
                amount
                currencyCode
              }
              inventoryLevels(first: 100) {
                nodes {
                  location{
                    id
                    legacyResourceId
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
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
