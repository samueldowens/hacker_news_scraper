require_relative 'environment'

class Hacker_News_Scraper_App < Sinatra::Base
  #put your route handlers here

   get '/' do
    @topfour = Article.topfour
    erb :index
   end

   get '/test' do
    @topfour = Article.topfour
     erb :new_index
   end

   post '/refresh' do
    Hacker_news_scraper.new
    redirect '/test'
   end

end
