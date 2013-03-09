#3/5/2013
#hw2 part 2
#added method all_ratings to the Movie class
#added method filter_list to filter the movie list by rating  I could not make it filter

class Movie < ActiveRecord::Base

    def self.all_ratings
    	self.select(:rating).map(&:rating).uniq
    end

    def self.filter_list(selected_rating)
    	begin
    		self.where(:rating => selected_rating.key)
    	rescue
    		self.where(:rating => selected_rating)
    	end
    end

end


