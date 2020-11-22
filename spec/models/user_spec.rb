require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  context 'validation tests' do
    describe 'user create' do
      subject {user.save } 
      it { is_expected.to eq(true) }
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