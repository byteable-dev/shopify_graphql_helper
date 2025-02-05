# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindCollectionByTitleQuery
      QUERY = <<~QUERY
        query($query: String!) {
          collections(first: 1, query: $query) {
            nodes {
              id
              title
              handle
              updatedAt
              sortOrder
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
