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
            email
            note
            discountCodes
            currencyCode
            totalDiscounts
            totalDiscountsSet{
              presentmentMoney {
                amount
                currencyCode
              }
              shopMoney{
                amount
                currencyCode
              }
            }
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
            currentSubtotalPriceSet{
              presentmentMoney {
                amount
                currencyCode
              }
              shopMoney{
                amount
                currencyCode
              }
            }
            subtotalPriceSet{
              presentmentMoney {
                amount
                currencyCode
              }
              shopMoney{
                amount
                currencyCode
              }
            }
            subtotalLineItemsQuantity
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
            shippingAddress{
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
            channelInformation{
              id
              channelId
              channelDefinition {
                id
                channelName
              }
            }
            customer {
              id
              firstName
              lastName
              displayName
              email
              numberOfOrders
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
              name
            }
            paymentGatewayNames
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
                discountAllocations {
                  discountApplication{
                    targetSelection
                    targetType
                    index
                    allocationMethod
                    value{
                      ... on MoneyV2 {
                        amount
                        currencyCode
                      }
                    }
                  }
                  allocatedAmount {
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
                  title
                  legacyResourceId
                  vendor
                  productType
                }
                customAttributes{
                  key
                  value
                }
              }
            }
            refunds(first: 10){
              id
              legacyResourceId
              createdAt
              note
              order {
                id
                legacyResourceId
              }
              refundLineItems(first: 20){
                nodes{
                  id
                  quantity
                  location {
                    id
                    name
                  }
                  lineItem{
                    id
                    sku
                    taxLines(first: 10){
                      rate
                      priceSet{
                        presentmentMoney {
                          amount
                          currencyCode
                        }
                        shopMoney{
                          amount
                          currencyCode
                        }
                      }
                    }
                  }
                  priceSet{
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
                  subtotalSet{
                    presentmentMoney {
                      amount
                      currencyCode
                    }
                    shopMoney{
                      amount
                      currencyCode
                    }
                  }
                }
              }
            }
            taxLines{
              priceSet{
                presentmentMoney {
                  amount
                  currencyCode
                }
                shopMoney{
                  amount
                  currencyCode
                }
              }
              rate
              title
              channelLiable
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
