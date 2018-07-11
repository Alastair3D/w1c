require 'weather'

describe Weather do

  describe '#stormy' do
    it { is_expected.to respond_to(:stormy?) }
    it 'returns a boolean' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
