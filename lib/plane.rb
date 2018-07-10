class Plane

  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

  def ground
    @flying = false
  end

  def fly
    @flying = true
  end

end
