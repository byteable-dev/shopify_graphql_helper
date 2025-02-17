# frozen_string_literal: true

module ShopifyGraphqlHelper
  class QueryResolver
    QUERIES = {
      shop: ShopifyGraphqlHelper::Queries::ShopQuery,
      products: ShopifyGraphqlHelper::Queries::ProductsQuery,
      product_variants: ShopifyGraphqlHelper::Queries::ProductVariantsQuery,
      search_product_variants: ShopifyGraphqlHelper::Queries::SearchProductVariants,
      search_orders: ShopifyGraphqlHelper::Queries::SearchOrdersQuery,
      find_inventory_item: ShopifyGraphqlHelper::Queries::FindInventoryItemQuery,
      find_inventory_level: ShopifyGraphqlHelper::Queries::FindInventoryLevelQuery,
      find_product: ShopifyGraphqlHelper::Queries::FindProductQuery,
      find_product_variant: ShopifyGraphqlHelper::Queries::FindProductVariantQuery,
      find_order: ShopifyGraphqlHelper::Queries::FindOrderQuery,
      find_location: ShopifyGraphqlHelper::Queries::FindLocationQuery,
      find_collection_by_title: ShopifyGraphqlHelper::Queries::FindCollectionByTitleQuery,
      staff_members: ShopifyGraphqlHelper::Queries::StaffMembersQuery,
      orders: ShopifyGraphqlHelper::Queries::OrdersQuery,
      fulfillment_orders: ShopifyGraphqlHelper::Queries::FulfillmentOrdersQuery,
      locations: ShopifyGraphqlHelper::Queries::LocationsQuery,
      inventory_items: ShopifyGraphqlHelper::Queries::InventoryItemsQuery,
      search_product_variant_metfeild_definitions: ShopifyGraphqlHelper::Queries::SearchProductVariantMetafieldDefiniations
    }.freeze

    MUTATIONS = {
      product_create: ShopifyGraphqlHelper::Mutations::ProductCreateMutation,
      product_update: ShopifyGraphqlHelper::Mutations::ProductUpdateMutation,
      product_variant_create: ShopifyGraphqlHelper::Mutations::ProductVariantCreateMutation,
      product_variant_bulk_update: ShopifyGraphqlHelper::Mutations::ProductVariantBulkUpdateMutation,
      product_variant_bulk_create: ShopifyGraphqlHelper::Mutations::ProductVariantBulkCreateMutation,
      inventory_item_update: ShopifyGraphqlHelper::Mutations::InventoryItemUpdateMutation,
      inventory_adjustment: ShopifyGraphqlHelper::Mutations::InventoryAdjustQuantitiesMutation,
      activate_inventory_item: ShopifyGraphqlHelper::Mutations::ActivateInventoryItemMutation,
      update_order_metafield: ShopifyGraphqlHelper::Mutations::UpdateOrderMetafieldsMutation,
      set_metafield: ShopifyGraphqlHelper::Mutations::SetMetafieldMutation,
      fulfillment_create: ShopifyGraphqlHelper::Mutations::FulfillmentCreateMutation,
      collection_create: ShopifyGraphqlHelper::Mutations::CollectionCreateMutation
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
