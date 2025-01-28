# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class FulfillmentCreateMutation
      MUTATION = <<~QUERY
        mutation FulfillmentCreate($fulfillment: FulfillmentV2Input!) {
          fulfillmentCreateV2(fulfillment: $fulfillment) {
            fulfillment {
              fulfillmentLineItems(first: 10) {
                edges {
                  node {
                    id
                    lineItem {
                      title
                      variant {
                        id
                      }
                    }
                    quantity
                    originalTotalSet {
                      shopMoney {
                        amount
                        currencyCode
                      }
                    }
                  }
                }
              }
              status
              estimatedDeliveryAt
              location {
                id
                legacyResourceId
              }
              service {
                handle
              }
              trackingInfo(first: 10) {
                company
                number
                url
              }
              originAddress {
                address1
                address2
                city
                countryCode
                provinceCode
                zip
              }
            }
            userErrors {
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
