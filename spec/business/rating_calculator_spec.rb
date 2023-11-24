# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingCalculator, type: :business do
  describe '.calculate' do
    let!(:movie) { create(:movie) }

    subject { described_class.calculate(movie) }

    describe 'with ratings' do
      it 'calculate average rating' do
        create_list(:rating, 5) do |rating, i|
          rating.movie = movie
          rating.grade = i + 1
          rating.save!
        end

        subject

        expect(movie.rating).to eq(3)
      end
    end

    describe 'without ratings' do
      it 'keep default value' do
        subject

        expect(movie.rating).to eq(1)
      end
    end
  end
end
