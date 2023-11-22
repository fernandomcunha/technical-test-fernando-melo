# frozen_string_literal: true

class YearWithMostMovie < ApplicationRecord
  belongs_to :searchable, polymorphic: true

  def readonly?
    true
  end
end
