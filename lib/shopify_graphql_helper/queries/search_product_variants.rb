# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchProductVariants
      QUERY = <<~QUERY
        query($query: String!) {
          productVariants(first: 1, query: $query) {
            edges {
              node {
                id
                sku
                inventoryItem {
                  id
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
