# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class MetafieldDefinitionCreateMutation
      MUTATION = <<~QUERY
        mutation CreateMetafieldDefinition($definition: MetafieldDefinitionInput!) {
          metafieldDefinitionCreate(definition: $definition) {
            createdDefinition {
              id
              name
              ownerType
            }
            userErrors {
              field
              message
              code
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
