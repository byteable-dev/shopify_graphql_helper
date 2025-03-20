# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindCollectionQuery
      QUERY = <<~QUERY
        query GetCollection($id: ID!) {
          collection(id: $id) {
            id
            title
            description
            descriptionHtml
            handle
            updatedAt
            sortOrder
            image {
              url
            }
            products(first: 50) {
              nodes {
                id
                title
              }
            }
            updatedAt
          }
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
