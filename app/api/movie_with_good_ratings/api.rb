# frozen_string_literal: true

module MovieWithGoodRatings
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    resource :movie_with_good_ratings do
      desc 'returns movies with at leat one rating 4 or 5'
      get do
        MovieWithGoodRating.all
      end
    end
  end
end
