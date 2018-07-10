require 'plane'

describe Plane do

  describe '#initialize' do
    it 'defaults @flying as false' do
      expect(subject.flying).to eq false
    end
  end

  describe '#land' do
    it { is_expected.to respond_to :land }
    it 'should change @flying to false' do
      subject.land
      expect(subject.flying).to eq false
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
    it 'should change @flying to true' do
      subject.take_off
      expect(subject.flying).to eq true
    end
  end

end
