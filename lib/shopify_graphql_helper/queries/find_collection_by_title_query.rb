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
              description
              descriptionHtml
              handle
              updatedAt
              sortOrder
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
              ruleSet{
                appliedDisjunctively
                rules{
                  column
                  relation
                  condition
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
