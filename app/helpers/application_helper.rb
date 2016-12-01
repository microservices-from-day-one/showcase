module ApplicationHelper
  def home_products(limit: 8)
    @home_products ||= ApiClient::Books::Book.paginate(page: 1, per_page: limit).to_a
  end

  def social_links
    @social_links ||= [] # ApiClient::StoreService.find_social_links(headers: headers_for_service)
  end

  def categories
    @categories ||= ApiClient::Books::Category.all
  end

  def featured_categories
    @featured_categories ||= ApiClient::Books::Category.featured.first(2)
  end

  def shopping_cart
    @shopping_cart ||= ApiClient::Purchases::Cart.find(current_cart_id).first
  rescue JsonApiClient::Errors::ConnectionError => e
    Rails.logger.error("Error loading shopping_cart: e=#{e.message}")
    # TODO: alert that an error is happening
    nil
  end

  def find_product(id)
    ApiClient::Books::Book.find(id).first
  end

  def render_price(value)
    return unless value
    number_to_currency(value.to_f/100)
  end

  def percentage_off(price, full_price)
    ((1-price.to_f/full_price.to_f) * 100).to_i
  end
end
