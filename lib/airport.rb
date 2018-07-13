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
    @hangar.delete(plane)
    "#{plane} has left the airport"
  end

  def land(plane)
    plane.ground
    @hangar << plane
  end

# private

  def clear_to_launch(plane)
    fail 'ERROR - PLANE NOT IN HANGAR' unless @hangar.include?(plane)
    fail 'WEATHER WARNING - DO NOT LAUNCH' if weather.stormy?
  end

  # def clear_to_land
  # end

  def weather
    Weather.new
  end


end
