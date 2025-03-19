# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindProductQuery
      QUERY = <<~QUERY
        query GetProduct($id: ID!) {
          product(id: $id) {
            id
            title
            descriptionHtml
            tags
            publishedAt
            handle
            productType
            vendor
            status
            templateSuffix
            hasOutOfStockVariants
            options(first: 50){
              id
              name
              position
              values
              linkedMetafield{
                key
                namespace
              }
            }
            media(first: 20){
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
            variants(first: 10) {
              nodes {
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
                  inventoryLevels(first: 50) {
                    nodes {
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
                inventoryPolicy
                inventoryQuantity
                taxable
                taxCode
                product {
                  id
                }
              }
            }
            collections(first: 10) {
              nodes {
                id
                title
                description
                descriptionHtml
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
