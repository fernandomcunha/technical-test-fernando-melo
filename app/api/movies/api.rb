# frozen_string_literal: true

module Movies
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    content_type :jsonapi, 'application/vnd.api+json'
    formatter :json, Grape::Formatter::Jsonapi
    formatter :jsonapi, Grape::Formatter::Jsonapi

    resource :movies do
      desc 'returns all movies'
      get do
        Movie.all
      end

      desc 'searches a movie using title'
      params do
        optional :title, type: String, desc: 'search term'
      end

      get '/search' do
        movies = Movie.title_ilike(params[:title])

        error! 'nothing for this search', :not_found unless movies.any?

        movies.first
      end

      desc 'Show information about a particular movie'
      params do
        requires :id, type: String, desc: 'movie ID.'
      end

      get '/:id' do
        movie = Movie.find_by_id(params[:id])

        error! 'not found', :not_found unless movie

        movie
      end

      desc 'Create a movie.'
      params do
        requires :title, type: String, desc: 'Movie title.'
        requires :release_date, type: Date, desc: 'Movie release date'
        optional :runtime, type: String, desc: 'Movie runtime'
        optional :genre, type: String, desc: 'Movie genre'
        optional :parental_rating, type: String, desc: 'Movie'
        optional :plot, type: String, desc: 'Movie'
      end

      post do
        Movie.create!({
                        title: params[:title],
                        release_date: params[:release_date],
                        runtime: params[:runtime],
                        genre: params[:genre],
                        parental_rating: params[:parental_rating],
                        plot: params[:plot]
                      })
      end

      desc 'Delete a movie.'
      params do
        requires :id, type: String, desc: 'movie ID.'
      end
      delete ':id' do
        Movie.find(params[:id]).destroy
      end
    end
  end
end
