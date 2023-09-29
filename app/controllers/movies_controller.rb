class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("movie_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch("movie_title")
    @movie.year = params.fetch("movie_year")
    @movie.duration = params.fetch("movie_duration")
    @movie.description = params.fetch("movie_description")
    @movie.image = params.fetch("movie_image")
    @movie.director_id = params.fetch("movie_director_id")

    if @movie.valid?
      @movie.save
      redirect_to("/movies", { :notice => "Movie created successfully." })
    else
      redirect_to("/movies", { :notice => "Movie failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("movie_id")
    @movie = Movie.where({ :id => the_id }).at(0)

    @movie.title = params.fetch("movie_title")
    @movie.year = params.fetch("movie_year")
    @movie.duration = params.fetch("movie_duration")
    @movie.description = params.fetch("movie_description")
    @movie.image = params.fetch("movie_image")
    @movie.director_id = params.fetch("movie_director_id")


    if @movie.valid?
      @movie.save
      redirect_to("/movies/#{the_id}", { :notice => "Movie updated successfully." })
    else
      redirect_to("/movies/#{the_id}", { :notice => "Movie failed to update successfully." })
    end
  end

  def delete
    the_id = params.fetch("movie_id")
    @movie = Movie.where({ :id => the_id }).at(0)

    @movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
