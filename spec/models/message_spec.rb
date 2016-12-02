require 'rails_helper'

describe Message do
  describe '#create' do
    it 'is valid with body'do
      message = build(:message)
      expect(message).to be_valid
    end
  end
end
