# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchProductVariantMetafieldDefiniations
      QUERY = <<~QUERY
        query($query: String!) {
          metafieldDefinitions(first: 100, ownerType: PRODUCTVARIANT, query: $query) {
            edges {
              node {
                name
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