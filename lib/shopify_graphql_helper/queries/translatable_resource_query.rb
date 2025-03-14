# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class TranslatableResourceQuery
      QUERY = <<~QUERY
        query($resourceId: ID!, $locale: String!) {
          translatableResource(resourceId: $resourceId) {
            resourceId
            translatableContent{
              key
              value
              digest
              locale
            }
            translations(locale: $locale) {
              key
              value
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
