# frozen_string_literal: true

require_relative 'shopify_graphql_helper/version'

require "shopify_api"

require 'shopify_graphql_helper/client'
require 'shopify_graphql_helper/query_resolver'

module ShopifyGraphqlHelper
  class Error < StandardError; end
  
  # Queries
  require 'shopify_graphql_helper/queries'

  # Mutations
  require 'shopify_graphql_helper/queries'
end
