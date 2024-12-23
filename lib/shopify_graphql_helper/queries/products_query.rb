# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ProductsQuery
      QUERY = <<~GRAPHQL
        query($first: Int!) {
          products(first: $first) {
            edges {
              node {
                id
                title
                variants(first: 10) {
                  edges {
                    node {
                      id
                      price
                    }
                  }
                }
              }
            }
          }
        }
      GRAPHQL

      def self.query
        QUERY
      end
    end
  end
end
