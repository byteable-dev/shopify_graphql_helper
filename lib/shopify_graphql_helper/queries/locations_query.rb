# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class LocationsQuery
      QUERY = <<~QUERY
        query {
          locations(first: 10) {
            nodes {
              id
              name
              address {
                city
                country
                countryCode
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
