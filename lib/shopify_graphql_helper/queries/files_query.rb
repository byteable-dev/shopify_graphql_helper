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
                mimeType
                mediaContentType
                originalSource {
                  url
                  fileSize
                  }
                image {
                  url
                }
              }
              ... on Video {
                filename
                duration
                mediaContentType
                originalSource {
                  url
                  fileSize
                  format
                  mimeType
                  height
                  width
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
