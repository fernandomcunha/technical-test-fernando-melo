# frozen_string_literal: true

class CreateMovieWithGoodRatings < ActiveRecord::Migration[6.1]
  def change
    create_view :movie_with_good_ratings
  end
end
