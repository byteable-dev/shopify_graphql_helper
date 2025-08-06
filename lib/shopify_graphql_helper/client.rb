# frozen_string_literal: true

module ShopifyGraphqlHelper
  class Client
    OPEN_TIMEOUT = 10   # seconds to open the TCP socket
    READ_TIMEOUT = 60   # seconds to read the HTTP response
    SSL_TIMEOUT  = 60   # seconds to complete the TLS handshake
    MAX_RETRIES  = 2

    attr_reader :session

    def initialize(session)
      @session = session
    end

    def query(query:, variables: {})
      attempts = 0
      graphql_client.query(query: query, variables: variables)
    rescue Net::ReadTimeout, EOFError, OpenSSL::SSL::SSLError => exception
      Rails.logger.warn(
        "[ShopifyGraphqlHelper] network error (#{exception.class}): #{exception.message}, retry #{attempts}/#{MAX_RETRIES}"
      )
      retry if attempts <= MAX_RETRIES
      handle_error(exception)
    rescue ShopifyAPI::Errors::HttpResponseError => exception
      Rails.logger.error(
        "[ShopifyGraphqlHelper] GraphQL HTTP Error: #{exception.message}"
      )
      Rails.logger.error("Variables: #{variables}")
      Rails.logger.error("GraphQL Query Error: #{exception.message}")
      handle_error(exception)
    end

    private

    def graphql_client
      @graphql_client ||= ShopifyAPI::Clients::Graphql::Admin.new(session:)
    end

    def handle_error(error)
      raise "GraphQL Error: #{error}"
    end
  end
end
