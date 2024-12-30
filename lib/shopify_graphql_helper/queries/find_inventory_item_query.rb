# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindInventoryItemQuery
      QUERY = <<~QUERY
        query inventoryItem($id: ID!, $locationId: ID!) {
          inventoryItem(id: $id) {
            id
            tracked
            sku
            inventoryLevel(locationId: $locationId) {
              id
              quantities(names: "available"){
                name
                quantity
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
