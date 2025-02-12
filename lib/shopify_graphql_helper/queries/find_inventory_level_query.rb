# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindInventoryLevelQuery
      QUERY = <<~QUERY
        query inventoryLevel($id: ID!) {
          inventoryLevel(id: $id) {
            id
            quantities(names: ["available", "incoming", "committed", "damaged", "on_hand", "quality_control", "reserved", "safety_stock"]) {
              name
              quantity
            }
            item {
              id
              sku
            }
            location {
              id
              name
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
