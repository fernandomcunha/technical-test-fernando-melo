# frozen_string_literal: true

class CreateMovieWithoutRatings < ActiveRecord::Migration[6.1]
  def change
    create_view :movie_without_ratings
  end
end
