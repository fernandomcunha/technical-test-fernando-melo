# frozen_string_literal: true

FactoryBot.define do
  factory :highest_rated_by_genre do
    title { 'Foo Bar' }
    genre { 'Action' }
    rating { 3.7 }
  end
end
