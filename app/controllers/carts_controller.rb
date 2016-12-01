class CartsController < ApplicationController
  def show
  end

  def add_item
    book = ApiClient::Books::Book.find(params[:book_id]).first
    item = {
      item_id: book.id,
      quantity: params[:quantity] || 1,
      price: book.price
    }
    response = ApiClient::PurchasesService.add_item_to_cart(cart_id: current_cart_id, params: {item: item}, headers: headers_for_service)

    flash[:notice] = "Added to Cart"
    redirect_to :back
  end

  def remove_item
    ApiClient::PurchasesService.remove_item_from_cart(cart_id: current_cart_id, item_id: params[:book_id], headers: headers_for_service)

    flash[:notice] = "Removed from Cart"
    redirect_to :back
  end
end
