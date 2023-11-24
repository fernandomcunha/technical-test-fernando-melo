# frozen_string_literal: true

class CreateHighestRatedByGenres < ActiveRecord::Migration[6.1]
  def change
    create_view :highest_rated_by_genres
  end
end
