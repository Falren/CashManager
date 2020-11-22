require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'creates user' do
      expect(user.save).to eq(true)
    end
  end
end
