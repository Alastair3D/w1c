require 'airport'

describe Airport, :airport do
  let(:plane) { double :plane }
  let(:calm_weather) { double :weather, stormy?: false }
  let(:stormy_weather) { double :weather, stormy?: true }
  DEFAULT_CAPACITY = 20

  describe '#initialize', :initialize do
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

  describe '#take_off', :take_off do
    before { subject.hangar << plane }

      it { is_expected.to respond_to(:take_off).with(1).argument }

      context 'when weather is calm' do
        it 'causes plane to take flight' do
          p1 = Plane.new
          subject.land(p1)
          subject.take_off(p1)
          expect(p1.flying?).to be true
        end        #
        # it 'causes a doubled plane to take flight' do
        #   subject.take_off(plane)
        #   expect(plane).to receive(:fly)
        # end
        it 'checks the plane has left the hangar' do
          p1 = Plane.new
          subject.land(p1)
          subject.take_off(p1)
          expect(subject.hangar).not_to include p1
        end
        # it 'confirms the plane has taken off' do
        #   subject.take_off(plane).to raise 'Plane has left the airport'
        # end
      end

      context 'when the weather is stormy' do
          it 'disallows plane to take flight' do
            p1 = Plane.new
            subject.land(p1)
            subject.take_off(p1)
            end
          end

  describe '#clear_to_launch' do
      it 'checks plane is in hangar' do
        subject.hangar.delete(plane)
        expect { subject.clear_to_launch(plane) }.to raise_error 'ERROR - PLANE NOT IN HANGAR'
      end
     it 'safety checks weather' do
        p1 = Plane.new
        subject.land(p1)
        w1 = Weather.new
        w1.stormy?
        expect { subject.clear_to_launch(plane) }.to raise_error 'WEATHER WARNING - DO NOT LAUNCH'
      end
    end


  describe '#land', :land do
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
    #
    # describe '#clear_to_land' do
    #   it 'checks there is space in the hangar' do
    #     20.times { subject.land(plane) }
    #     allow(plane).to receive(:ground).and_return(true)
    #     expect { subject.land(plane) }.to raise_error 'ERROR - HANGAR FULL'
    #   end
    #   it 'safety checks weather' do
    #     w1 = Weather.new
    #     w1.stormy?
    #     allow(weather).to receive(:stormy?).and_return(true)
    #     expect { subject.land(plane) }.to
    #   end
    # end


  end


end
