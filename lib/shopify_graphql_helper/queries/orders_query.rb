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
              note
              discountCodes
              currencyCode
              totalPriceSet{
                presentmentMoney {
                  amount
                  currencyCode
                }
                shopMoney{
                  amount
                  currencyCode
                }
              }
              totalTaxSet{
                presentmentMoney {
                  amount
                  currencyCode
                }
                shopMoney{
                  amount
                  currencyCode
                }
              }
              totalShippingPriceSet{
                presentmentMoney {
                  amount
                  currencyCode
                }
                shopMoney{
                  amount
                  currencyCode
                }
              }
              billingAddress{
                address1
                address2
                city
                company
                country
                countryCodeV2
                firstName
                lastName
                name
                phone
                timeZone
                zip
                countryCode
              }
              app {
                id
              }
              customer {
                id
                firstName
                lastName
                displayName
                email
                defaultAddress{
                  address1
                  address2
                  city
                  company
                  zip
                  countryCode
                }
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
                email
              }
              lineItems(first: 250) {
                nodes {
                  id
                  name
                  title
                  sku
                  quantity
                  image{
                    url
                  }
                  originalUnitPriceSet{
                    presentmentMoney {
                      amount
                      currencyCode
                    }
                    shopMoney{
                      amount
                      currencyCode
                    }
                  }
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
                    legacyResourceId
                    title
                  }
                  product {
                    id
                    legacyResourceId
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
