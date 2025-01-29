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
              email
              note
              currencyCode
              displayFulfillmentStatus
              displayFinancialStatus
              createdAt
              processedAt
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
                    lineItem{
                      id
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
                transactions(first: 20){
                  nodes{
                    id  
                    kind
                    gateway
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
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
