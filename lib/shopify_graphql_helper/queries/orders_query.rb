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
                emailMarketingConsent{
                  consentUpdatedAt
                  marketingState
                }
                smsMarketingConsent{
                  consentUpdatedAt
                  marketingState
                }
              }
              staffMember{
                id
              }
              lineItems(first: 250) {
                nodes {
                  id
                  name
                  sku
                  quantity
                  originalTotalSet{
                    presentmentMoney {
                      amount
                      currencyCode
                    }
                    shopMoney{
                      amount
                      currencyCode
                    }
                  }
                  totalDiscountSet {
                    presentmentMoney {
                      amount
                      currencyCode
                    }
                    shopMoney{
                      amount
                      currencyCode
                    }
                  }
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
