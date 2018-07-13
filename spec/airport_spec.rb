require 'airport'

describe Airport, :airport do
  let(:capacity) { double :capacity}
  let(:plane) { double :Plane }
  let(:weather) { double :weather, stormy?: stormy }
  let(:stormy) { false }
  before { allow(Weather).to receive(:new).and_return(weather) }

  DEFAULT_CAPACITY = 20

  describe '#initialize', :initialize do
    it 'defaults with capacity of 20 when no paramaters present' do
      expect(subject.capacity).to eq(DEFAULT_CAPACITY)
    end
    it 'allows variable capacity to be passed' do
      different_capacity = 30
      a1 = Airport.new(different_capacity)
      expect(a1.capacity).to eq different_capacity
      expect(Airport.new(50).capacity).to eq 50
    end
    it 'defaults with an empty @hangar' do
      expect(subject.hangar).to be_empty
    end
  end

  describe '#take_off', :take_off do
    before { subject.hangar << plane }
      it { is_expected.to respond_to(:take_off).with(1).argument }

      context 'when weather is calm' do
        before { subject.hangar << plane }
          it 'causes plane to take flight' do
            allow(plane).to receive(:fly).and_return(true)
            allow(plane).to receive(:flying?).and_return(true)
              subject.take_off(plane)
              expect(plane.flying?).to be true
          end
          it 'causes plane to take flight - actual plane object' do
            p1 = Plane.new
            subject.land(p1)
            subject.take_off(p1)
            expect(p1.flying?).to be true
          end
        it 'checks the plane has left the hangar' do
          p1 = Plane.new
          subject.land(p1)
          subject.take_off(p1)
          expect(subject.hangar).not_to include p1
        end
      end

      context 'when the weather is stormy' do
        let(:stormy) { true }
          it 'disallows plane to take flight' do
            p1 = Plane.new
            subject.land(p1)
            expect{ subject.take_off(p1) }.to raise_error 'WEATHER WARNING - DO NOT LAUNCH'
          end
      end

  describe '#clear_to_launch' do
      it 'checks plane is in hangar' do
        subject.hangar.delete(plane)
          expect { subject.clear_to_launch(plane) }.to raise_error 'ERROR - PLANE NOT IN HANGAR'
      end
      context 'when the weather is calm' do
          it 'safety checks weather' do
            expect { subject.clear_to_launch(plane) }.not_to raise_error
          end
      end
      context 'when the weather is stormy' do
          let(:stormy) { true }
          it 'safety checks weather' do
            expect { subject.clear_to_launch(plane) }.to raise_error 'WEATHER WARNING - DO NOT LAUNCH'
          end
      end
    end

  describe '#land', :land do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'causes plane to land' do
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

    describe '#clear_to_land' do
      it 'checks the plane is airborne' do
          expect { subject.clear_to_land(plane) }.to raise_error 'ERROR - PLANE NOT IN SKY'
      end
      it 'checks there is space in the hangar' do
        # allow(plane).to receive(:ground).and_return(false)
        subject.capacity.times { subject.hangar << plane }
        # allow(capacity).to receive(:times).and_return(20)
        #   subject.capacity.times { subject.land(plane) }
          # subject.capacity.times { subject.hangar << plane }
          20.times { subject.hangar << plane }
          p1 = Plane.new
          # Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
          expect { subject.land(p1) }.to raise_error 'CAPACITY WARNING - DO NOT LAND'
      end
    end

    # subject.capacity.times { subject.planes << plane }
    # expect { subject.land(plane) }.to raise_error 'This airport is at maximum capacity'
    #


   #    # it 'safety checks weather' do
   #    #   w1 = Weather.new
   #    #   w1.stormy?
   #    #   allow(weather).to receive(:stormy?).and_return(true)
   #    #   expect { subject.land(plane) }.to
   #    # end
   #  end
   #
   #  context 'when the weather is stormy' do
   #  let(:stormy) { true }
   #
   # it 'raises an error when trying to land a plane' do
   #   expect { subject.land(plane) }.to raise_error 'The weather does not permit landing'
   # end


  end


end
