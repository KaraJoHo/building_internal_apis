require 'rails_helper'

#trying out jsonapi-serializer for v3

describe "Books API" do
  it "sends a list of books/displays all attributes of previous versions" do
    create_list(:book, 3)

    get '/api/v3/books'

    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(books.count).to eq(3)

    books.each do |book|
      expect(book).to have_key(:id)
      expect(book[:attributes][:id]).to be_an(Integer)

      expect(book[:attributes]).to have_key(:title)
      expect(book[:attributes][:title]).to be_a(String)

      expect(book[:attributes]).to have_key(:author)
      expect(book[:attributes][:author]).to be_a(String)

      expect(book[:attributes]).to have_key(:genre)
      expect(book[:attributes][:genre]).to be_a(String)

      expect(book[:attributes]).to have_key(:summary)
      expect(book[:attributes][:summary]).to be_a(String)

      expect(book[:attributes]).to have_key(:popularity)
      expect(book[:attributes][:popularity]).to be_an(String)
     
      expect(book[:attributes]).to have_key(:number_sold)
      expect(book[:attributes][:number_sold]).to be_an(Integer)
    end
  end

  it 'adds page number and displays the page number if it is over 500 pages' do 

    create_list(:book, 2)
    1.times { |b| create :book, page_count: 200}
  
    get '/api/v3/books'

    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)[:data]
  
    expect(books[2]).to_not have_key(:page_count)
  end
end