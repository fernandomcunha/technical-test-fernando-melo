# frozen_string_literal: true

module MovieWithMostRatings
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    resource :movie_with_most_ratings do
      desc 'returns top 10 movies with most ratings'
      get do
        MovieWithMostRating.all
      end
    end
  end
end
