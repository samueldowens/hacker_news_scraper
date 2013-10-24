require '../environment'
require 'pry'

class TopFourHN
  include DataMapper::Resource


  def self.topfour 
    #searches HN table for the top 4 entries by points 
    #and returns them in... an array
    @topfourarticles = Article.all(:order => [ :points.desc ])
    #what kind of data structure does this return? I just want the top 4
    #in an array to pass back to the controller
    binding.pry
  end

end
Datamapper.finalize