class Api::V2::BooksController < ApplicationController 
  def index 
    books = Book.all 
    render json: V2::BookSerializer.format_books(books)
  end
end