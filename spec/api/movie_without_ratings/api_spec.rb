# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieWithoutRatings::API do
  describe 'GET /api/v1/movie_without_ratings' do
    it 'returns movies without any rating' do
      create_list(:movie, 3) do |movie, i|
        movie.title = "Movie #{i + 1}"
        movie.save
      end

      create(:rating) do |rating|
        rating.movie.title = 'Movie With Rating'
        rating.save
      end

      get '/api/v1/movie_without_ratings/'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Movie 1')
      expect(response.body).to include('Movie 2')
      expect(response.body).to include('Movie 3')
      expect(response.body).to_not include('Movie With Rating')
    end
  end
end
