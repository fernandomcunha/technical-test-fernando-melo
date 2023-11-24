# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingJob, type: :job do
  let!(:rating) { create(:rating) }

  describe '.perform' do
    it 'call RatingCalculator' do
      expect(RatingCalculator).to receive(:calculate).with(rating.movie)

      described_class.perform_now(rating.movie.id)
    end
  end
end
