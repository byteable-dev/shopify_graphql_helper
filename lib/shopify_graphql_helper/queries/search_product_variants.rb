# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchProductVariants
      QUERY = <<~QUERY
        query($query: String!, $first: Int = 50, $after: String) {
          productVariants(first: $first, after: $after, query: $query) {
            edges {
              node {
                id
                legacyResourceId
                inventoryQuantity
                inventoryPolicy
                title
                displayName
                sku
                barcode
                price
                compareAtPrice
                taxable
                selectedOptions{
                  name
                  value
                  optionValue{
                    id
                    name
                  }
                }
                media(first: 10){
                  nodes{
                    id
                    alt
                    mediaContentType
                    preview {
                      image {
                        id
                        url
                      }
                    }
                  }
                }
                metafields(first: 20){
                  nodes{
                    id
                    legacyResourceId
                    key
                    value
                    type
                    namespace
                    ownerType
                    description
                    jsonValue
                    definition{
                      name
                      type{
                        category
                        name
                        supportedValidations{
                          name
                          type
                        }
                      }
                      validations{
                        name
                        type
                        value
                      }
                    }
                  }
                }
                product{
                  id
                  title
                  descriptionHtml
                  options(first: 20) {
                    id
                    position
                    name
                    values
                    optionValues {
                      id
                      name
                      hasVariants
                    }
                  }
                }
                inventoryItem{
                  id
                  legacyResourceId
                  sku
                  tracked
                  countryCodeOfOrigin
                  duplicateSkuCount
                  createdAt
                  provinceCodeOfOrigin
                  requiresShipping
                  measurement{
                    id
                    weight{
                      unit
                      value
                    }
                  }
                  unitCost{
                    amount
                    currencyCode
                  }
                  inventoryLevels(first: 100) {
                    nodes {
                      id
                      location{
                        id
                      }
                      quantities(names: "available") {
                        name
                        quantity
                      }
                    }
                  }
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
