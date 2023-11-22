# frozen_string_literal: true

module HighestRatedByGenres
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    resource :highest_rated_by_genres do
      desc 'returns highest rated movie by genre'
      get do
        HighestRatedByGenre.all
      end
    end
  end
end
