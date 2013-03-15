# Feb. 28, hw2 1.b
# created sort method 

module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  #sorts movies by title or release date
  def sort(movie)
  	if(params[:sort].to_s == 'title')
  		return movie.title
  	elsif(params[:sort].to_s == 'release')
  		return movie.release_date
  	end
  end

end
