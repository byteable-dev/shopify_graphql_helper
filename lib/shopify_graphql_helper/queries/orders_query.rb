# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class OrdersQuery
      QUERY = <<~QUERY
        query($numOrders: Int!, $cursor: String) {
          orders(first: $numOrders, after: $cursor) {
            nodes {
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
              }
              lineItems(first: 250) {
                nodes {
                  id
                  name
                  sku
                  originalTotalSet
                  totalDiscountSet
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
