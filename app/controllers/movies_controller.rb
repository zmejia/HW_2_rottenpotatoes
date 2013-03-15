
# 3/5/2013 HW 2 part 1b, 2, & 3
#created the variable @all_ratings, @sort
#created session

class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    if params[:sort]
      @sort = params[:sort]
    end
    @all_ratings = Movie.all_ratings
    redirect = false
    logger.debug(session.inspect)

    # hw2 part 2 sorting by ratings
    #sorting by rating when refresh is clciked
    if params[:commit] == "Refresh" and params[:ratings].nil?
      @ratings = nil
      session[:ratings] = nil
    elsif params[:ratings]
      @ratings = params[:ratings]
      session[:ratings] = params[:ratings]
    elsif session[:ratings]
      @ratings = session[:ratings]
      redirect = true
    else
      @ratings = nil
    end

    if redirect
      flash.keep
      redirect_to movies_path :sort=>@sort, :ratings=>@ratings
    end

     #sorts by raiting
    if @ratings and @sort
      @movies = Movie.where(:rating => @ratings.keys).find(:all, :order => (@sort_by))
    elsif @ratings
      @movies = Movie.where(:rating => @ratings.keys)
    elsif @sort
      @movies = Movie.find(:all, :order => (@sort))
    else
      @movies = Movie.all
    end
    if !@ratings
      @ratings = Hash.new
    end 

   session[:param] = params
  end

  def new
    # default: render 'new' template

  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path(session[:param])
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
