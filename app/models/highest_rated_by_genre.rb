# frozen_string_literal: true

class HighestRatedByGenre < ApplicationRecord
  belongs_to :searchable, polymorphic: true

  def readonly?
    true
  end
end
