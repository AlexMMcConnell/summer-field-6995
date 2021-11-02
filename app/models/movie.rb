class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def sorted_actors
    self.actors.order(:age)
  end

  def average_age
    self.actors.average(:age)
  end
end
