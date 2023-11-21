# frozen_string_literal: true

class AddDefaultValueToRating < ActiveRecord::Migration[6.1]
  def up
    change_column :movies, :rating, :decimal, default: 1, precision: 2, scale: 1
  end

  def down
    change_column :movies, :rating, :float
  end
end
