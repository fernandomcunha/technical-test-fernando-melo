# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :ratings, dependent: :destroy

  validates_numericality_of :rating, greater_than: 0, less_than: 6

  scope :title_ilike, ->(title) { where("title ILIKE '%#{title}%'") }
end
