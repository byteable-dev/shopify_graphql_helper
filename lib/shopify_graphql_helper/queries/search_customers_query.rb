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
              events(first: 5, sortKey: CREATED_AT, reverse: true) {
                nodes {
                  id
                  action
                  appTitle
                  attributeToApp
                  attributeToUser
                  createdAt
                  criticalAlert
                  message
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