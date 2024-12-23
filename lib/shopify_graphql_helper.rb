# frozen_string_literal: true

require_relative 'shopify_graphql_helper/version'

require 'shopify_api'

module ShopifyGraphqlHelper
  class Error < StandardError; end

  require 'shopify_graphql_helper/client'
  require 'shopify_graphql_helper/query_resolver'

  # Queries
  require 'shopify_graphql_helper/queries/products_query'
  
  # Mutations
  require 'shopify_graphql_helper/mutations/update_product_mutation'
end
