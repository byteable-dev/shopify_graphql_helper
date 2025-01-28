# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class InventoryItemUpdateMutation
      MUTATION = <<~QUERY
        mutation inventoryItemUpdate($id: ID!, $input: InventoryItemInput!) {
          inventoryItemUpdate(id: $id, input: $input) {
            inventoryItem {
              id
              unitCost {
                amount
              }
              tracked
              countryCodeOfOrigin
              provinceCodeOfOrigin
              harmonizedSystemCode
              countryHarmonizedSystemCodes(first: 1) {
                edges {
                  node {
                    harmonizedSystemCode
                    countryCode
                  }
                }
              }
            }
            userErrors {
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
