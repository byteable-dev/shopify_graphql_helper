# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class CollectionCreateMutation
      MUTATION = <<~QUERY
        mutation createCollectionMetafields($input: CollectionInput!) {
          collectionCreate(input: $input) {
            collection {
              id
              title
              description
              descriptionHtml
              handle
              metafields(first: 3) {
                edges {
                  node {
                    id
                    namespace
                    key
                    value
                  }
                }
              }
            }
            userErrors {
              message
              field
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
