require_relative 'environment'

class Hacker_News_Scraper_App < Sinatra::Base
  #put your route handlers here

 get '/' do
  
  erb :index
 end

  

end
