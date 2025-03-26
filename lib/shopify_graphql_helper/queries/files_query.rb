# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FilesQuery
      QUERY = <<~QUERY
        query($numFiles: Int!, $cursor: String) {
          files(first: $numFiles, after: $cursor){
            nodes{
              id
              alt
              fileStatus
              preview{
                image{
                  id
                  altText
                  url
                }
                status
              }
              ... on MediaImage {
                image {
                  url
                }
              }
              ... on Video {
                duration
                mediaContentType
                originalSource { 
                  url
                }
              }
            }
            pageInfo{
              hasPreviousPage
              hasNextPage
              startCursor
              endCursor
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
