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
                  available
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