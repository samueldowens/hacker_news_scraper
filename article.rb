class Article
  attr_accessor :title, :url, :votes, :parent_url

  @@all_articles = []

  def self.all_articles
    @@all_articles
  end

  def initialize(hash)
    @name = hash[:name]
    @url = hash[:url]
    @votes = hash[:votes]
    @parent_url = hash[:parent_url]
    self.add_if_not_duplicate
  end

  def add_if_not_duplicate
    if @@all_articles.include?(self) == false
      @@all_articles << self
    end
  end

end