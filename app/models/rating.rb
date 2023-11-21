# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie

  validates_numericality_of :grade, greater_than: 0, less_than: 6

  after_create :recalculate_movie_rating

  def recalculate_movie_rating
    RatingJob.perform_later(movie.id)
  end
end
