# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ShopQuery
      QUERY = <<~QUERY
        query {
          shop {
            name
            primaryDomain
            moneyFormat
            myshopifyDomain
            phone
            email
            shopOwnerName
            zip
            currencyCode
            ianaTimezone
          }
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
