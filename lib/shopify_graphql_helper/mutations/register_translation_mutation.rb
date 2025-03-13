# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class RegisterTranslationMutation
      MUTATION = <<~QUERY
        mutation translationsRegister($resourceId: ID!, $translations: [TranslationInput!]!) {
          translationsRegister(resourceId: $resourceId, translations: $translations) {
            userErrors {
              message
              field
            }
            translations {
              key
              value
            }
          }
        }
      QUERY

      def self.mutation
        MUTATION
      end
    end
  end
end
