# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class ShopLocalesQuery
      QUERY = <<~QUERY
        query {
          shopLocales {
            name
            locale
            primary
            published
          }
        }
      QUERY

      def self.query
        QUERY
      end
    end
  end
end
