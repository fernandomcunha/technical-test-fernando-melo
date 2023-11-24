# frozen_string_literal: true

class RatingCalculator
  attr_accessor :movie

  def self.calculate(*args)
    new(*args).calculate
  end

  def initialize(movie)
    @movie = movie
  end

  def calculate
    ActiveRecord::Base.transaction do
      break unless movie.ratings.exists?

      movie.rating = BigDecimal(movie.ratings.map(&:grade).sum) / movie.ratings.count
      movie.save
    end
  end
end
