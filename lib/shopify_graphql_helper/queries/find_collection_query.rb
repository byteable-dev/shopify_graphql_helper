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
            templateSuffix
            handle
            updatedAt
            sortOrder
            image {
              url
              originalSrc
            }
            seo{
              description
              title
            }
            resourcePublications(onlyPublished: true) {
              nodes{
                isPublished
                publication{
                  autoPublish
                  name
                }
              }
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
