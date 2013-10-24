class Article
include DataMapper::Resource

  def initialize(hash = {})
    property :id,         Serial
    property :name        String
    property :url,        String
    property :points,     Serial
    property :parent_url, String
    self.save
  end


end

DataMapper.finalize