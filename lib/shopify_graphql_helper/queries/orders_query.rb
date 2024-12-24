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
              displayFulfillmentStatus
              customer {
                id
                firstName
                displayName
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
              metafields(first: 5) {
                edges {
                  node {
                    id
                    namespace
                    key
                    value
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
