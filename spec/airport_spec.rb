require 'airport'

describe Airport do
  let(:plane) { double :bike }

  describe '#initialize' do
    it 'defaults with empty @planes array' do
      expect(subject.planes).to eq []
    end
  end
end
