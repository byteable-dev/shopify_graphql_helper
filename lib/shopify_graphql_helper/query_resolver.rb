# frozen_string_literal: true

module ShopifyGraphqlHelper
  # Resolves and executes GraphQL queries and mutations
  class QueryResolver
    # Mapping of query keys to their respective classes
    QUERIES = {
      shop: ShopifyGraphqlHelper::Queries::ShopQuery,
      products: ShopifyGraphqlHelper::Queries::ProductsQuery,
      product_variants: ShopifyGraphqlHelper::Queries::ProductVariantsQuery,
      search_product_variants: ShopifyGraphqlHelper::Queries::SearchProductVariants,
      search_orders: ShopifyGraphqlHelper::Queries::SearchOrdersQuery,
      find_inventory_item: ShopifyGraphqlHelper::Queries::FindInventoryItemQuery,
      find_product_variant: ShopifyGraphqlHelper::Queries::FindProductVariantQuery,
      find_order: ShopifyGraphqlHelper::Queries::FindOrderQuery,
      find_location: ShopifyGraphqlHelper::Queries::FindLocationQuery,
      staff_members: ShopifyGraphqlHelper::Queries::StaffMembersQuery,
      orders: ShopifyGraphqlHelper::Queries::OrdersQuery,
      locations: ShopifyGraphqlHelper::Queries::LocationsQuery
    }.freeze

    MUTATIONS = {
      product_variant_bulk_update: ShopifyGraphqlHelper::Mutations::ProductVariantBulkUpdateMutation,
      inventory_adjustment: ShopifyGraphqlHelper::Mutations::InventoryAdjustQuantitiesMutation,
      activate_inventory_item: ShopifyGraphqlHelper::Mutations::ActivateInventoryItemMutation,
      update_order_metafield: ShopifyGraphqlHelper::Mutations::UpdateOrderMetafieldsMutation,
      set_metafield: ShopifyGraphqlHelper::Mutations::SetMetafieldMutation
    }.freeze

    DEFAULT_QUERY_VARIABLES = {
      numProducts: 250,
      numOrders: 250,
      cursor: nil
    }.freeze

    attr_reader :session

    # @param session [ShopifyAPI::Auth::Session] the Shopify session object
    def initialize(session)
      @session = session
    end

    # Executes a query
    #
    # @param query_key [Symbol] the key identifying the query
    # @param variables [Hash] the variables for the query
    # @return [GraphQL::Client::Response] the API response
    # @raise [ArgumentError] if the query key is not found
    #
    # @example Executing a products query
    #   resolver.execute_query(:products, { first: 10 })
    def execute_query(query_key, variables = DEFAULT_QUERY_VARIABLES)
      query_class = QUERIES[query_key]
      raise ArgumentError, "Unknown query key: #{query_key}" unless query_class

      query = query_class.query
      client.query(query: query, variables: variables)
    end

    # Executes a mutation
    #
    # @param mutation_key [Symbol] the key identifying the mutation
    # @param variables [Hash] the variables for the mutation
    # @return [GraphQL::Client::Response] the API response
    # @raise [ArgumentError] if the mutation key is not found
    #
    # @example Executing a product update mutation
    #   resolver.execute_mutation(:update_product, { input: { id: "gid://shopify/Product/123", title: "Updated Title" } })
    def execute_mutation(mutation_key, variables = {})
      mutation_class = MUTATIONS[mutation_key]
      raise ArgumentError, "Unknown mutation key: #{mutation_key}" unless mutation_class

      mutation = mutation_class.mutation
      client.query(query: mutation, variables: variables)
    end

    private

    def client
      @client ||= ShopifyGraphqlHelper::Client.new(session)
    end
  end
end
