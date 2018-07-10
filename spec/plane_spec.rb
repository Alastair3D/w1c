require 'plane'

describe Plane do

  describe '#land' do
    it 'should respond to #land' do
    expect(subject).to respond_to :land
    end
  end


  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end




end
