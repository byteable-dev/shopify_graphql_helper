# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class InventoryAdjustQuantitiesMutation
      MUTATION = <<~QUERY
        mutation inventoryAdjustQuantities($input: InventoryAdjustQuantitiesInput!) {
          inventoryAdjustQuantities(input: $input) {
            userErrors {
              code
              field
              message
            }
            inventoryAdjustmentGroup {
              createdAt
              reason
              changes {
                name
                delta
                quantityAfterChange
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
