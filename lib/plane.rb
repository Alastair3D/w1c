class Plane
  attr_accessor :flying

  def initialize(flying = false)
    @flying = flying
  end

  def land
  end

  def take_off
    @flying = true
  end

end
