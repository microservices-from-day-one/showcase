module BooksHelper
  def book_reviews(book_id)
    ApiClient::Reviews::Review.where(book_id: book_id).all
  end
end
