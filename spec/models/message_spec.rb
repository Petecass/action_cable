require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  describe 'ActiveRecord associations' do
    subject { build(:message) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'ActiveModel validations' do
    subject { build(:message) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe '#mentions' do
    let!(:bob) { create(:user, name: 'bob') }
    let!(:alice) { create(:user, name: 'alice') }
    let!(:anon) { create(:user, name: 'anon') }
    let(:message) { create(:message, content: 'this metnions @bob and @alice') }
    it 'returns a list of users' do
      expect(message.mentions).to include alice
      expect(message.mentions.length).to eq 2
    end
  end
end
