module Move

  #if moving toy robot doesn't fall to destruction, it sends move action to current facing way and it moves by increasing or decreasing x and y class variables. if it is, doesn't move toy_robot and prints destructive move warning.
  def move
    if send "can_move_#{@facing.downcase}"
      send "move_#{@facing.downcase}"
    else
      destructive_move_warning
    end
  end

  def move_north
    @y += 1
  end

  def move_south
    @y -= 1
  end

  def move_east
    @x += 1
  end

  def move_west
    @x -= 1
  end

  def can_move_north
    @y + 1 <= ToyRobot::NORTH_EAST_MOST_CORNER
  end

  def can_move_south
    @y - 1 >= ToyRobot::SOUTH_WEST_MOST_CORNER
  end

  def can_move_east
    @x + 1 <= ToyRobot::NORTH_EAST_MOST_CORNER
  end

  def can_move_west
    @x - 1 >= ToyRobot::SOUTH_WEST_MOST_CORNER
  end

  def destructive_move_warning
    puts 'Place do not fall your toy robot to destruction :('
  end
end