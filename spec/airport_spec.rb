require 'airport'

describe Airport do
  let(:plane) { double :plane }
  DEFAULT_CAPACITY = 20

  describe '#initialize' do
    it 'defaults with capacity of 20 when no paramaters present' do
      expect(subject.capacity).to eq(DEFAULT_CAPACITY)
    end
    it 'allows variable capacity to be passed' do
      different_capacity = 30
      a1 = Airport.new(different_capacity)
      expect(a1.capacity).to eq different_capacity
    end
    it 'defaults with an empty @hangar' do
      expect(subject.hangar).to be_empty
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'sets @flying to true' do
      p1 = Plane.new
      subject.land(p1) 
      subject.take_off(p1)
      expect(p1.flying?).to be true
    end
  end

  describe '#clear_to_launch' do
    it 'safety checks before take_off' do
      p1 = Plane.new
      expect { subject.clear_to_launch(p1) }.to raise_error 'ERROR - DO NOT LAUNCH'
    end
  end


  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'sets @flying to false' do
      p1 = Plane.new
      subject.land(p1)
      expect(p1.flying?).to eq false
    end
    it 'adds plane to @hangar' do
      p1 = Plane.new
      subject.land(p1)
      expect(subject.hangar).to include p1
    end

  end


end
