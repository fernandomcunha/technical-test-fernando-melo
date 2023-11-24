# frozen_string_literal: true

module MovieWithoutRatings
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    resource :movie_without_ratings do
      desc 'returns movies without any rating'
      get do
        MovieWithoutRating.all
      end
    end
  end
end
