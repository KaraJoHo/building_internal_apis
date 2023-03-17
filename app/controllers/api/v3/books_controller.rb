class Api::V3::BooksController < ApplicationController 
  def index 
    render json: V3::BookSerializer.new(Book.all)
  end
end