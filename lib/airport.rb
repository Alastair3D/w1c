class Airport
  attr_reader :capacity, :flying, :hangar

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def take_off(plane)
    plane.fly
    return "#{plane} has left the airport"
  end

  def land(plane)
    plane.ground
  end

end
