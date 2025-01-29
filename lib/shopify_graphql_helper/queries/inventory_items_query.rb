# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class InventoryItemsQuery
      QUERY = <<~QUERY
        query($numItems: Int!, $cursor: String) {
          inventoryItems(first: $numItems, after: $cursor) {
            nodes {
              id
              legacyResourceId
              tracked
              sku
              variant{
                id
                legacyResourceId
                sku
              }
              inventoryLevels(first: 50){
                nodes{
                  id
                  location{
                    id
                    legacyResourceId
                    name
                  }
                  quantities(names: "available"){
                    name
                    quantity
                  }
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
