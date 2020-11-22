require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user) { create(:user) }
  let(:company) { build(:company, user_id: user.id) }
  
  context 'validation tests' do 
    describe 'it does not create a user with status teacher' do
      subject {company.save}
      it { is_expected.to eq(false) }
    end
    it 'should not create a company without a name' do 
      company.name = nil
      expect(company.save).to eq(false)
    end
    it 'should not create a company without a country' do 
      company.country = nil
      expect(company.save).to eq(false)
    end
    it 'should not create a company without a country' do 
      company.country = nil
      expect(company.save).to eq(false)
    end

  end
  describe 'Company belongs to user' do 
    it { expect(Company.reflect_on_association(:user).macro).to eq(:belongs_to) }
  end
end
