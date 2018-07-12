require 'plane'

describe Plane do

  describe '#initialize' do
    it 'defaults @flying as false' do
      expect(subject.flying?).to eq false
    end
  end

  describe '#flying?' do
    it 'returns @flying status' do
      expect(subject.flying?).to eq false
    end
  end

  describe '#ground' do
    it 'sets @flying to false' do
    expect(subject.ground).to eq false
    end
  end

  describe '#fly' do
    it 'sets @flying to true' do
      expect(subject.fly).to eq true
    end
  end

end
