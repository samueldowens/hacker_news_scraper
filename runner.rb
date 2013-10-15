require 'nokogiri'
require 'sqlite3'
require 'restclient'
require 'pry'
require_relative 'article.rb'
require_relative 'hacker_news_scraper.rb'
require_relative 'database.rb'


3.times do Hacker_news_scraper.new
end

Database.insert(Article.all_articles)
puts Article.all_articles
# binding.pry