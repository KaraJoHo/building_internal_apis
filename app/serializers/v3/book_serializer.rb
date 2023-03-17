class V3::BookSerializer 
  include JSONAPI::Serializer 

  attributes :id, :title, :author, :genre, :summary, :number_sold, :popularity
  attribute :page_count, if: Proc.new { |book| book.page_count >= 500 }
end