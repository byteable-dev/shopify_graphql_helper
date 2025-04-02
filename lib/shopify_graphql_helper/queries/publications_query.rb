# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class PublicationsQuery
      QUERY = <<~QUERY
        query {
          publications(first: 50) {
            nodes {
              id
              name
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
