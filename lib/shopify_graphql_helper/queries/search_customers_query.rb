# frozen_string_literal: true

module ShopifyGraphqlHelper
  module Queries
    class SearchCustomersQuery
      QUERY = <<~QUERY
        query($query: String!, $first: Int = 250, $after: String) {
          customers(first: $first, after: $after, query: $query) {
            nodes {
              id
              firstName
              lastName
              email
              phone
              createdAt
              updatedAt
              acceptsMarketing
              emailMarketingConsent {
                marketingState
                marketingOptInLevel
                consentUpdatedAt
              }
              smsMarketingConsent {
                marketingState
                marketingOptInLevel
                consentUpdatedAt
              }
              defaultAddress {
                address1
                address2
                city
                company
                country
                countryCodeV2
                firstName
                lastName
                phone
                province
                provinceCode
                zip
              }
              ordersCount
              totalSpent
              tags
              metafields(first: 20) {
                nodes {
                  id
                  namespace
                  key
                  value
                  type
                }
              }
            }
            pageInfo {
              hasNextPage
              endCursor
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