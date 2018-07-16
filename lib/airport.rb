class Airport
  attr_reader :capacity, :hangar, :flying

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
    clear_to_land(plane)
    plane.ground
    @hangar << plane
  end

  def clear_to_launch(plane)
    fail 'ERROR - PLANE NOT IN HANGAR' unless @hangar.include?(plane)
    fail 'WEATHER WARNING - DO NOT LAUNCH' if weather.stormy?
  end

  def clear_to_land(plane)
    fail 'ERROR - PLANE NOT IN SKY' if @hangar.include?(plane)
    fail 'CAPACITY WARNING - DO NOT LAND' if @hangar.length >= capacity
    fail 'WEATHER WARNING - DO NOT LAND' if weather.stormy?
  end


  private

  def weather
    Weather.new
  end

  def full?
    @hangar.length >= @capacity
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

end
