# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindOrderQuery
      QUERY = <<~QUERY
        query findOrder($id: ID!) {
          order(id: $id) {
            id
            legacyResourceId
            name
            processedAt
            createdAt
            displayFulfillmentStatus
            displayFinancialStatus
            app {
              id
            }
            customer {
              id
              firstName
              displayName
            }
            staffMember{
              id
              email
            }
            lineItems(first: 250) {
              nodes {
                id
                name
                sku
                variant {
                  id
                }
                product {
                  id
                }
                customAttributes{
                  key
                  value
                }
              }
            }
            metafields(first: 10) {
              nodes {
                id
                namespace
                key
                value
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
