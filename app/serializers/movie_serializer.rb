# frozen_string_literal: true

class MovieSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :release_date, :runtime, :genre, :parental_rating, :plot, :rating, :created_at, :updated_at
end
