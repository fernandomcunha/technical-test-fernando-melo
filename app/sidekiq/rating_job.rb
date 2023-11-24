# frozen_string_literal: true

class RatingJob < ActiveJob::Base
  queue_as :rating_calculator

  def perform(movie_id)
    movie = Movie.find(movie_id)
    ::RatingCalculator.calculate(movie)
  end
end
