require 'airport'

describe Airport do
  let(:plane) { double :bike }

  describe '#initialize' do
    it 'defaults with empty @hangar' do
      expect(subject.hangar).to eq []
    end
  end
end



#   describe '#take_off' do
#     it { is_expected.to respond_to :take_off }
#     it 'should change @flying to true' do
#       subject.take_off
#       expect(subject.flying).to eq true
#     end
#   end
#

#   describe '#land' do
#     it { is_expected.to respond_to :land }
#     it 'should change @flying to false' do
#      subject.land
#      expect(subject.flying).to eq false
#   end
#   it 'adds plane to @hangar' do
#     subject.land
#   end
# end
