# Feb. 28, hw2 1.b
# created sort method 
# created helper_class method

module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def sort(movie)
  	if(params[:sort].to_s == 'title')
  		return movie.title
  	elsif(params[:sort].to_s == 'release')
  		return movie.release_date.to_s
  	end
  end

  def helper_class(value)
  	if(params[:sort].to_s == value) 
  		return 'hilite'
  	else
  		return nil
  	end
  end

end
