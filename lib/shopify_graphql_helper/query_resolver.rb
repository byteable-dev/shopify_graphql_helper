# frozen_string_literal: true

module ShopifyGraphqlHelper
  class QueryResolver
    QUERY_MAP = {
      products: ::ShopifyGraphqlHelper::Queries::ProductsQuery,
      update_product: ::ShopifyGraphqlHelper::Mutations::UpdateProductMutation
    }.freeze

    def initialize(session)
      @client = ShopifyGraphqlHelper::Client.new(session)
    end

    def execute_query(query_key, variables = {})
      query_class = QUERY_MAP[query_key]
      raise ArgumentError, "Unknown query key: #{query_key}" unless query_class

      query = query_class.query
      @client.query(query: query, variables: variables)
    end

    def execute_mutation(mutation_key, variables = {})
      mutation_class = QUERY_MAP[mutation_key]
      raise ArgumentError, "Unknown mutation key: #{mutation_key}" unless mutation_class

      mutation = mutation_class.mutation
      @client.query(query: mutation, variables: variables)
    end
  end
end
