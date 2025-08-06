require 'net/http'

Net::HTTP.class_eval do
  alias_method :orig_initialize, :initialize

  def initialize(*args, &block)
    orig_initialize(*args, &block)

    # apply gem’s timeout constants
    self.open_timeout = ShopifyGraphqlHelper::Client::OPEN_TIMEOUT
    self.read_timeout = ShopifyGraphqlHelper::Client::READ_TIMEOUT

    return unless respond_to?(:ssl_timeout=)

    self.ssl_timeout = ShopifyGraphqlHelper::Client::SSL_TIMEOUT
  end
end
