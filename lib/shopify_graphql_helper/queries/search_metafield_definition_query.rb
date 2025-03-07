# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchMetafieldDefinitionQuery
      QUERY = <<~QUERY
        query($query: String!, $ownerType: MetafieldOwnerType!) {
          metafieldDefinitions(first: 50, ownerType: $ownerType, query: $query) {
            nodes {
              id
              name
              description
              key
              namespace
              type{
                name
                category
              }
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
