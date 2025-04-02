# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class UnpublishCollectionMutation
      MUTATION = <<~QUERY
        mutation publishableUnpublish($id: ID!, $input: [PublicationInput!]!) {
          publishableUnpublish(id: $id, input: $input) {
            publishable {
              availablePublicationsCount {
                count
              }
              resourcePublicationsCount {
                count
              }
            }
            shop {
              publicationCount
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
