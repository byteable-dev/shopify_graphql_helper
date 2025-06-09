# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindFileByNameQuery
      QUERY = <<~QUERY
        query($query: String!) {
          files(first: 10, query: $query) {
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
