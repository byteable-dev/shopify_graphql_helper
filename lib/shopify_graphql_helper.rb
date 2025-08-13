# frozen_string_literal: true

require_relative 'shopify_graphql_helper/version'

require 'shopify_api'

module ShopifyGraphqlHelper
  class Error < StandardError; end
  # Dynamically load all queries
  Dir[File.join(__dir__, 'shopify_graphql_helper/queries/**/*.rb')].each { |file| require file }

  # Dynamically load all mutations
  Dir[File.join(__dir__, 'shopify_graphql_helper/mutations/**/*.rb')].each { |file| require file }
end

# require_relative 'shopify_graphql_helper/net_http_patch'
require 'shopify_graphql_helper/client'
require 'shopify_graphql_helper/query_resolver'
