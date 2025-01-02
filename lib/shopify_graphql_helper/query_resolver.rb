# frozen_string_literal: true

module ShopifyGraphqlHelper
  class QueryResolver
    QUERIES = {
      shop: ShopifyGraphqlHelper::Queries::ShopQuery,
      products: ShopifyGraphqlHelper::Queries::ProductsQuery,
      product_variants: ShopifyGraphqlHelper::Queries::ProductVariantsQuery,
      search_product_variants: ShopifyGraphqlHelper::Queries::SearchProductVariants,
      find_inventory_item: ShopifyGraphqlHelper::Queries::FindInventoryItemQuery,
      staff_members: ShopifyGraphqlHelper::Queries::StaffMembersQuery,
      orders: ShopifyGraphqlHelper::Queries::OrdersQuery,
      find_order: ShopifyGraphqlHelper::Queries::FindOrderQuery
    }.freeze

    MUTATIONS = {
      product_variant_bulk_update: ShopifyGraphqlHelper::Mutations::ProductVariantBulkUpdateMutation,
      inventory_adjustment: ShopifyGraphqlHelper::Mutations::InventoryAdjustQuantitiesMutation,
      activate_inventory_item: ShopifyGraphqlHelper::Mutations::ActivateInventoryItemMutation
    }.freeze

    DEFAULT_QUERY_VARIABLES = {
      numProducts: 250,
      numOrders: 250,
      cursor: nil
    }.freeze

    attr_reader :session

    def initialize(session)
      @session = session
    end

    def execute_query(query_key, variables = DEFAULT_QUERY_VARIABLES)
      query_class = QUERIES[query_key]
      raise ArgumentError, "Unknown query key: #{query_key}" unless query_class

      query = query_class.query
      client.query(query: query, variables: variables)
    end

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
