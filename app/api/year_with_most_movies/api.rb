# frozen_string_literal: true

module YearWithMostMovies
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    resource :year_with_most_movies do
      desc 'returns year with most released movies'
      get do
        YearWithMostMovie.all
      end
    end
  end
end
