require_relative '../environment'
require 'pry'
class Article < Sequel::Model

  def self.topfour 
    #searches HN table for the top 4 entries by points 
    #and returns them in... an array
    # binding.pry
    # Article.all(:order => [ :points.desc ])
    sort = Article.order(Sequel.desc(:points))
    [sort[1], sort[2], sort[3], sort[4]]
    #what kind of data structure does this return? I just want the top 4
    #in an array to pass back to the controller
  end


end

