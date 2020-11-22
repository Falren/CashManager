require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'creates user' do
      expect(user.save).to eq(true)
    end
    it 'validates presence of name' do
      user.name = nil
      expect(user.save).to eq(false)
    end
    it 'validates presence of surname' do
      user.surname = nil
      expect(user.save).to eq(false)
    end
    it 'validates presence of status' do
      user.status = nil
      expect(user.save).to eq(false)
    end
    it 'should not create user without confirmed password' do
      user.password = '123456'
      user.password_confirmation = '1234567'
      expect(user.save).to eq(false)
    end
  end
  describe 'User has many companies' do 
    it { expect(User.reflect_on_association(:companies).macro).to eq(:has_many) }
  end
end