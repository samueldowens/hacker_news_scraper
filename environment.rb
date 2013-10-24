require 'bundler'
Bundler.require

require 'nokogiri' 
require 'rack' #, '~>1.1' 
# require 'rspec', :require => 'spec'
require 'sinatra'
# require 'timers'
require 'data_mapper'
require 'rest-client'
require 'sqlite3'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/articles.db")

require_relative 'models/article'
require_relative 'models/hacker_news_scraper'
require_relative 'models/top_4'
require_relative 'controllers/hacker_news_controller'

