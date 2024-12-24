# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class InventoryItemQuery
      QUERY = <<~QUERY.freeze
        query inventoryItem {
          inventoryItem(id: "#{payload[:inventory_item_id]}") {
            id
            tracked
            sku
            inventoryLevel(locationId: "#{payload[:location_id]}") {
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
