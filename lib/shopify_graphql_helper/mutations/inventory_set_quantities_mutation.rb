# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class InventorySetQuantitiesMutation
      MUTATION = <<~QUERY
        mutation inventorySetQuantities($input: InventorySetQuantitiesInput!) {
          inventorySetQuantities(input: $input) {
            inventoryAdjustmentGroup {
              createdAt
              reason
              referenceDocumentUri
              changes {
                name
                delta
                quantityAfterChange
              }
            }
            userErrors {
              code
              field
              message
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
