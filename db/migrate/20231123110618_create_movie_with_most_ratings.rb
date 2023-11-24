# frozen_string_literal: true

class CreateMovieWithMostRatings < ActiveRecord::Migration[6.1]
  def change
    create_view :movie_with_most_ratings
  end
end
