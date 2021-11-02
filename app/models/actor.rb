class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def other_actors
    Actor.joins(movies: [:actors]).where.not(id: self.id).distinct
  end
end
