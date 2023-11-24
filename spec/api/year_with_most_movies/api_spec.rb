# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YearWithMostMovies::API do
  describe 'GET /api/v1/year_with_most_movies' do
    it 'returns year with most movies and count' do
      create_list(:movie, 5, release_date: '2023-11-22')
      create_list(:movie, 15, release_date: '2022-11-22')

      get '/api/v1/year_with_most_movies/'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('2022')
      expect(response.body).to_not include('2023')
    end
  end
end
