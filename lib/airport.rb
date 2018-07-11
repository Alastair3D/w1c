class Airport
  attr_reader :capacity, :flying, :hangar

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def take_off(plane)
    clear_to_launch(plane)
    plane.fly
    "#{plane} has left the airport"
  end

  def clear_to_launch(plane)
    fail 'ERROR - DO NOT LAUNCH' unless @hangar.include?(plane)
  end

  def land(plane)
    plane.ground
    @hangar << plane
  end

end
