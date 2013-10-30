require 'bundler/setup'
Bundler.require

DB = Sequel.connect("sqlite://#{Dir.pwd}/db/articles.db")

require_relative 'models/article'
require_relative 'controllers/hacker_news_scraper'
require_relative 'app'


