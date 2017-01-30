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
end
