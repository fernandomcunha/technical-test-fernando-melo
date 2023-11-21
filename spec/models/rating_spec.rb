# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :movie }
  end

  describe 'validations' do
    it { should validate_numericality_of(:grade).is_greater_than(0).is_less_than(6) }
  end

  describe 'callbacks' do
    let(:rating) { build(:rating) }

    it 'triggers recalculate_movie_rating on save' do
      expect(rating).to receive(:recalculate_movie_rating)

      rating.save
    end
  end
end
