# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchOrdersQuery
      QUERY = <<~QUERY
        query($query: String!) {
          orders(first: 100, query: $query) {
            nodes {
              id
              legacyResourceId
              name
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
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
