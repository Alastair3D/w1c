require 'airport'

describe Airport do
  let(:plane) { double :bike }

  describe '#initialize' do
    it 'defaults with empty @hangar' do
      expect(subject.hangar).to eq []
    end
  end
end
