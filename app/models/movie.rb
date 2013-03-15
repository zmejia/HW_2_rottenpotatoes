#3/5/2013
#hw2 part 2
#added method all_ratings to the Movie class

class Movie < ActiveRecord::Base
    def self.all_ratings
    	self.select(:rating).map(&:rating).uniq
    end

end


