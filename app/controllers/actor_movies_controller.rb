class ActorMoviesController < ApplicationController
  def create
    actor = Actor.find_by(name: "#{params[:name]}")
    movie = Movie.find(params[:movie_id])
    ActorMovie.create(movie: movie, actor: actor)
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
