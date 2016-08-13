module Turn

  #turns facing of toy_robot to left and right by rotating array to left or right hand side and taking the value of given facing value index again
  def right
    @facing = ToyRobot::FACINGS.rotate[current_facing_index]
  end

  def left
    @facing = ToyRobot::FACINGS.rotate(-1)[current_facing_index]
  end

  def current_facing_index
    ToyRobot::FACINGS.find_index(@facing)
  end
end