# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ProductVariantsQuery
      QUERY = <<~QUERY
        query {
          productVariants(first: 10) {
            nodes{
              id
              title
              displayName
              sku
              price
              compareAtPrice
              contextualPricing(context: {country: DK}) {
                price {
                  amount
                  currencyCode
                }
                compareAtPrice {
                  amount
                  currencyCode
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
