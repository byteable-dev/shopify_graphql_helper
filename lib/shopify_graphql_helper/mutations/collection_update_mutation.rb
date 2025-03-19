# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class CollectionUpdateMutation
      MUTATION = <<~QUERY
        mutation CollectionUpdate($input: CollectionInput!) {
          collectionUpdate(input: $input) {
            collection {
              id
              title
              description
              descriptionHtml
              handle
            }
            userErrors {
              field
              message
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
