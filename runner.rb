require 'nokogiri'
require 'sqlite3'
require 'restclient'
require 'pry'
require_relative 'article.rb'
require_relative 'hacker_news_scraper.rb'
require_relative 'database.rb'


Hacker_news_scraper.new
puts Article.all_articles
