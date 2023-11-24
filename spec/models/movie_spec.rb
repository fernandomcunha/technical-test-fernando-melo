# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { should have_many(:ratings) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:rating).is_greater_than(0).is_less_than(6) }
  end
end
