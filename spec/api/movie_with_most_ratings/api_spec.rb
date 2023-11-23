# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieWithMostRatings::API do
  describe 'GET /api/v1/movie_without_ratings' do
    it 'returns top 10 movies with most ratings' do
      create_list(:movie, 10) do |movie, i|
        create_list(:rating, rand(10..15)) do |rating, _x|
          rating.movie = movie
          rating.save
        end

        movie.title = "Movie With Most Ratings #{i + 1}"
        movie.save
      end

      create_list(:movie, 5) do |movie, i|
        create_list(:rating, rand(1..5)) do |rating, _x|
          rating.movie = movie
          rating.save
        end

        movie.title = "Movie With Least Ratings #{i + 1}"
        movie.save
      end

      get '/api/v1/movie_with_most_ratings/'

      expect(response).to have_http_status(:ok)

      (1..10).each do |count|
        expect(response.body).to include("Movie With Most Ratings #{count}")
      end

      (1..5).each do |count|
        expect(response.body).to_not include("Movie With Least Ratings #{count}")
      end
    end
  end
end
