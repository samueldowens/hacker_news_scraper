require_relative 'environment'

class Hacker_News_Scraper_App < Sinatra::Base
  #put your route handlers here

 get '/' do
  # Hacker_news_scraper.new

  # Top4HN.topfour
  erb :index
 end

end
