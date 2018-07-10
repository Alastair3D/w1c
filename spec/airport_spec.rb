require 'airport'

describe Airport do
  let(:plane) {double :bike}

  describe '#initialize' do
    it 'with default empty @planes array' do
      expect(subject.planes).to eq []
    end
  end



end
