# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class ActivateInventoryItemMutation
      MUTATION = <<~QUERY
        mutation ActivateInventoryItem($inventoryItemId: ID!, $locationId: ID!, $available: Int) {
          inventoryActivate(inventoryItemId: $inventoryItemId, locationId: $locationId, available: $available) {
            inventoryLevel {
              id
              quantities(names: ["available"]) {
                name
                quantity
              }
              item {
                id
              }
              location {
                id
              }
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
