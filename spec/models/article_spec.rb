require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }
  context 'validation tests' do
    describe 'Article' do
      subject { article.save }
      it { is_expected.to eq(true) }
    end
    it 'should not create an article without a name' do
      article.name = nil
      expect(article.save).to eq(false)
    end
  end
end
