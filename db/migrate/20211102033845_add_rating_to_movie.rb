# frozen_string_literal: true

class AddRatingToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :rating, :float
  end
end
