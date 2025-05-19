# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class StaffMembersQuery
      QUERY = <<~QUERY
        {
          shop {
            staffMembers (first:100) {
              edges {
                node {
                  id
                  firstName
                  lastName
                  email
                }
              }
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
