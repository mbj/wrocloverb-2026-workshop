require 'spec_helper'

RSpec.describe Age do
  describe '#adult?' do
    it 'returns true for adults' do
      expect(Age.new(30).adult?).to be true
    end

    it 'returns false for minors' do
      expect(Age.new(10).adult?).to be false
    end
  end

  describe '#child?' do
    it 'returns true for children' do
      expect(Age.new(5).child?).to be true
    end

    it 'returns false for older ages' do
      expect(Age.new(30).child?).to be false
    end
  end

  describe '#teenager?' do
    it 'returns true for teenagers' do
      expect(Age.new(15).teenager?).to be true
    end

    it 'returns false for children' do
      expect(Age.new(5).teenager?).to be false
    end

    it 'returns false for adults' do
      expect(Age.new(30).teenager?).to be false
    end
  end

  describe '#can_vote?' do
    it 'returns true for adults' do
      expect(Age.new(30).can_vote?).to be true
    end
  end
end
