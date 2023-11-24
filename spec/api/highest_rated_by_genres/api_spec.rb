# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HighestRatedByGenres::API do
  describe 'GET /api/v1/highest_rated_by_genres' do
    it 'returns highest rated movies by genre' do
      %w[Drama Action Terror].each do |genre|
        create_list(:movie, 2) do |movie, i|
          movie.genre = genre
          movie.title = "#{genre} #{i + 1}"
          movie.rating = i + 1
          movie.save
        end
      end

      get '/api/v1/highest_rated_by_genres/'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Drama 2')
      expect(response.body).to include('Action 2')
      expect(response.body).to include('Terror 2')
    end
  end
end
