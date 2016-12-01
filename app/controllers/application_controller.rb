class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def book_details
    @book ||= ApiClient::Books::Book.where(slug: params[:id]).first
  end
  helper_method :book_details

  def current_cart_id
    if session[:cart_id].nil?
      cart = ApiClient::Purchases::Cart.create
      session[:cart_id] = cart.cart_id
    end
    session[:cart_id]
  end
  helper_method :current_cart_id

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  private :not_found

  def headers_for_service
    {
      'X-Request-Id' => request.uuid
    }
  end
  helper_method :headers_for_service
end
