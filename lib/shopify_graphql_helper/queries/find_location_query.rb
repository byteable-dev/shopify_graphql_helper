# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class FindLocationQuery
      QUERY = <<~QUERY
        query LocationShow($id: ID!) {
          location(id: $id) {
            id
            name
            address {
              address1
              address2
              city
              country
              countryCode
              province
              provinceCode
              zip
            }
            fulfillsOnlineOrders
            hasActiveInventory
            isActive
          }
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
