# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Movies::API => '/'
  mount Ratings::API => '/'
  mount HighestRatedByGenres::API => '/'
  mount YearWithMostMovies::API => '/'
  mount MovieWithGoodRatings::API => '/'
  mount MovieWithoutRatings::API => '/'

  mount Sidekiq::Web => '/sidekiq'
end
