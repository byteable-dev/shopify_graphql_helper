# frozen_string_literal: true

module ShopifyGraphqlHelper
  class Client
    DEFAULT_VARIABLES = {
      numProducts: 250,
      cursor: nil
    }.freeze

    attr_reader :session

    def initialize(session)
      @session = session
    end

    def query(query:, variables: DEFAULT_VARIABLES)
      graphql_client.query(query: query, variables: variables)
    rescue ShopifyAPI::Errors::HttpResponseError => exception
      handle_error(exception)
    end

    private

    def graphql_client
      @graphql_client ||= ShopifyAPI::Clients::Graphql::Admin.new(session:)
    end

    def handle_error(error)
      raise "GraphQL Error: #{error.message}"
    end
  end
end
