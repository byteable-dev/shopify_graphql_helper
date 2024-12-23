# frozen_string_literal: true

module ShopifyGraphqlHelper
  class Client
    def initialize(session)
      @graphql_client = ShopifyAPI::Clients::Graphql::Admin.new(session: session)
    end

    def query(query:, variables: {})
      @graphql_client.query(query: query, variables: variables)
    rescue ShopifyAPI::Errors::HttpResponseError => exception
      handle_error(exception)
    end

    private

    def handle_error(error)
      raise "GraphQL Error: #{error.message}"
    end
  end
end
