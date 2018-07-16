require 'airport'

describe Airport, :airport do
  let(:capacity) { double :capacity}
  let(:plane) { double :Plane }
  let(:weather) { double :weather, stormy?: stormy }
  let(:stormy) { false }
  before { allow(Weather).to receive(:new).and_return(weather) }

  # subject { Weather.new, (:weather) }

  DEFAULT_CAPACITY = 20

  describe '#initialize', :initialize do
    it 'defaults capacity to 20 when no paramaters present' do
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
        it 'checks plane has left hangar' do
          p1 = Plane.new
          subject.land(p1)
          subject.take_off(p1)
          expect(subject.hangar).not_to include p1
        end
      end
      context 'when weather is stormy' do
        let(:stormy) { true }
          it 'disallows plane to fly' do
            subject.hangar << plane
            expect{ subject.take_off(plane) }.to raise_error 'WEATHER WARNING - DO NOT LAUNCH'
          end
      end

  describe '#clear_to_launch' do
      it 'checks plane is in hangar' do
        subject.hangar.delete(plane)
          expect { subject.clear_to_launch(plane) }.to raise_error 'ERROR - PLANE NOT IN HANGAR'
      end
      context 'when weather is calm' do
          it 'safety checks weather before take_off' do
            expect { subject.clear_to_launch(plane) }.not_to raise_error
          end
      end
      context 'when weather is stormy' do
          let(:stormy) { true }
          it 'safety checks weather before take_off' do
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
      it 'checks plane is airborne' do
          expect { subject.clear_to_land(plane) }.to raise_error 'ERROR - PLANE NOT IN SKY'
      end
      it 'checks space in hangar' do
        subject.capacity.times { subject.hangar << plane }
        # Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
          p1 = Plane.new
          expect { subject.land(p1) }.to raise_error 'CAPACITY WARNING - DO NOT LAND'
      end
        context 'when weather is calm' do
          it 'safety checks weather before landing' do
            allow(plane).to receive(:fly).and_return(true)
            allow(plane).to receive(:flying?).and_return(true)
            subject.take_off(plane)
            expect { subject.clear_to_land(plane) }.not_to raise_error
          end
        end
        context 'when weather is stormy' do
          it 'safety checks weather before landing' do
            # p1 = Plane.new
            # allow(subject).to receive(take_off(p1))
            # allow(plane).to receive(:fly).and_return(true)
            # allow(plane).to receive(:flying?).and_return(true)
            allow(weather).to receive(:stormy?).and_return(false)
            allow(plane).to receive(:fly).and_return(true)
            subject.take_off(plane)
            allow(weather).to receive(:stormy?).and_return(true)
            expect { subject.clear_to_land(plane) }.to raise_error 'WEATHER WARNING - DO NOT LAND'
          end
        end
      end
    end

end
