module Place


  #parsing, validation and returning hash of three attributes of toy_robot object are made
  def place_toy_robot input
    command = parse input

    raise ArgumentError.new place_command_warning if !place_validates(command)

    return {
      x: command[1].to_i,
      y: command[2].to_i,
      facing: command[3]
    }
  end

  def place_validates command
    command[0] == 'PLACE' &&
    is_on_table(command[1].to_i) &&
    is_on_table(command[2].to_i) &&
    is_valid_facing(command[3])
  end

  #parsing given input by space and comma which is ex: PLACE 0,0,WEST
  def parse input
    return input.split(/[\s,]/)
  end

  #validates given position suits on the table which is 5x5
  def is_on_table position
    position.between? ToyRobot::SOUTH_WEST_MOST_CORNER, ToyRobot::NORTH_EAST_MOST_CORNER
  end

  #validates given facing argument is one of the available ones
  def is_valid_facing facing
    ToyRobot::FACINGS.include? facing
  end

  def place_command_warning
    'Start game by giving coordinates and facing of your toy robot. ex: PLACE 0,0,WEST'
  end
end