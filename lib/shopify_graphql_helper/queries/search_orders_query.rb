# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchOrdersQuery
      QUERY = <<~QUERY
        query($query: String!, $first: Int = 50, $after: String) {
          orders(first: $first, after: $after, query: $query) {
            nodes {
              id
              legacyResourceId
              name
              email
              phone
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
              totalRefundedSet{
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
              shippingLines(first: 10){
                nodes{
                  id
                  phone
                  title
                }
              }
              app {
                id
                name
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
              lineItems(first: 25) {
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
                  discountAllocations{
                    allocatedAmountSet{
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
                  variant {
                    id
                    legacyResourceId
                    title
                  }
                  product {
                    id
                    legacyResourceId
                    productType
                    category{
                      id
                      name
                    }
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
                      sku
                      quantity
                      customAttributes{
                        key
                        value
                      }
                      discountAllocations{
                        allocatedAmountSet{
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
            pageInfo {
              hasNextPage
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
