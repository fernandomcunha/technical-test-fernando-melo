# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieWithGoodRatings::API do
  describe 'GET /api/v1/movie_with_good_ratings' do
    it 'returns movies with at least one rating 4 or 5' do
      create(:movie) do |movie|
        movie.title = 'With good rating'
        create(:rating, movie: movie, grade: 4)
        movie.save
      end

      create(:movie) do |movie|
        movie.title = 'With bad rating'
        create(:rating, movie: movie, grade: 2)
        movie.save
      end

      get '/api/v1/movie_with_good_ratings/'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('With good rating')
      expect(response.body).to_not include('With bad rating')
    end
  end
end
