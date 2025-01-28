# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FulfillmentOrdersQuery
      QUERY = <<~QUERY
        query FulfillmentOrderList($orderId: ID!) {
          order(id: $orderId) {
            fulfillmentOrders(first: 250) {
              nodes {
                id
                createdAt
                updatedAt
                requestStatus
                status
                fulfillAt
                destination {
                  id
                  address1
                  address2
                  city
                  company
                  countryCode
                  email
                  firstName
                  lastName
                  phone
                  province
                  zip
                }
                lineItems(first: 250) {
                  nodes {
                    id
                    totalQuantity
                    inventoryItemId
                    remainingQuantity
                    variant {
                      id
                    }
                  }
                }
                internationalDuties {
                  incoterm
                }
                fulfillmentHolds {
                  reason
                  reasonNotes
                }
                fulfillBy
                deliveryMethod {
                  id
                  methodType
                  minDeliveryDateTime
                  maxDeliveryDateTime
                  additionalInformation {
                    instructions
                    phone
                  }
                  serviceCode
                  sourceReference
                  presentedName
                  brandedPromise {
                    handle
                    name
                  }
                }
                assignedLocation {
                  address1
                  address2
                  city
                  countryCode
                  location {
                    id
                  }
                  name
                  phone
                  province
                  zip
                }
                merchantRequests(first: 250) {
                  nodes {
                    message
                    requestOptions
                    kind
                  }
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
