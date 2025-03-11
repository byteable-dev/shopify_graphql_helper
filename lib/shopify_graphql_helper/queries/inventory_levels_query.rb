# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class InventoryLevelsQuery
      QUERY = <<~QUERY
        query inventoryLevels($variantId: ID!) {
          productVariant(id: $variantId) {
            inventoryItem {
              inventoryLevels(first: 50) {
                nodes {
                  quantities(names: ["available"]) {
                    name
                    quantity
                  }
                  location {
                    id
                    name
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