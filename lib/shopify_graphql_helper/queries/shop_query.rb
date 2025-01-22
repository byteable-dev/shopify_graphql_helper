# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ShopQuery
      QUERY = <<~QUERY
        query {
          shop {
            name
            primaryDomain{
              url
            }
            billingAddress{
              phone
              zip
            }
            myshopifyDomain
            email
            shopOwnerName
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
