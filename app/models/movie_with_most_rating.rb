# frozen_string_literal: true

class MovieWithMostRating < ApplicationRecord
  belongs_to :searchable, polymorphic: true

  def readonly?
    true
  end
end
