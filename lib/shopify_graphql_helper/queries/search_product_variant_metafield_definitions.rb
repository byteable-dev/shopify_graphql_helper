# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchProductVariantMetafieldDefiniations
      QUERY = <<~QUERY
        query {
          metafieldDefinitions(first: 100, ownerType: PRODUCTVARIANT) {
            nodes {
              id
              name
              description
              key
              namespace
              ownerType
              metafields(first: 20){
                nodes{
                  id
                  legacyResourceId
                  key
                  value
                  type
                  namespace
                  ownerType
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