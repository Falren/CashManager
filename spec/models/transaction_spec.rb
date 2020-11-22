require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { create(:user, status: 1) }
  let(:company) { create(:company, user_id: user.id) }
  let(:article) { create(:article) }
  let(:transaction) { build(:transaction, company_id: company.id, article_id: article.id) }
  context 'validation tests' do 
    it 'should not create a transaction in 2 years' do 
      transaction.transaction_time = 3.years.from_now
      expect(transaction.save).to eq(false)
    end
    it 'should not create transaction without set amount' do 
      transaction.amount = nil
      expect(transaction.save).to eq(false)
    end
  end
  describe 'Transaction belongs to company and article' do 
    it { expect(Transaction.reflect_on_association(:article).macro).to eq(:belongs_to) }
    it { expect(Transaction.reflect_on_association(:company).macro).to eq(:belongs_to) }
  end
end
