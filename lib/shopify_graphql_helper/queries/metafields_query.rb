# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class MetafieldsQuery
      QUERY = <<~QUERY
        query($type: MetafieldOwnerType!) {
          metafieldDefinitions(first: 250, ownerType: $type) {
            nodes {
              name
              metafields{
                nodes{
                  id
                  legacyResourceId
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
