# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Mutations
    class FileCreateMutation
      MUTATION = <<~QUERY
        mutation fileCreate($files: [FileCreateInput!]!) {
          fileCreate(files: $files) {
            files {
              id
              fileStatus
              alt
              createdAt
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
