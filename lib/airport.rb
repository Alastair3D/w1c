require 'plane'

class Airport
  attr_reader :capacity, :flying, :hangar

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def take_off(plane)
    plane.fly
  end

  def land(plane)
    plane.ground
  end

end
