class ToyRobot

  NUMBER_OF_DIMENSIONS = 5
  FACINGS = ['NORTH',
             'EAST',
             'SOUTH',
             'WEST']

  attr_accessor :x, :y, :facing

  def initialize stdin
    robot    = parse_input stdin
    @x       = robot[:x]
    @y       = robot[:y]
    @facing  = robot[:facing]
  end

  def parse_input input
    command  = input.split(' ')
    position = command[1].split(',')
    x        = position[0].to_i
    y        = position[1].to_i
    facing   = position[2]

    raise ArgumentError.newplace_command_warning if command[0] != 'PLACE' || !FACINGS.include?(position[2])

    return {
      x: x,
      y: y,
      facing: facing
    }
  end

  def report
    puts "OUTPUT: #{@x},#{@y},#{@facing}"
  end

  def move
    send "move_#{@facing.downcase}"
  end

  def move_north
    @y += 1 if can_move_north
  end

  def move_south
    @y -= 1 if can_move_south
  end

  def move_east
    can_move_east ? @x += 1 : destructive_move_warning
  end

  def move_west
    @x -= 1 if can_move_west
  end

  def can_move_north
    @y + 1 <= 5
  end

  def can_move_south
    @y - 1 >= 0
  end

  def can_move_east
    @x + 1 <= 5
  end

  def can_move_west
    @x - 1 >= 0
  end

  def right
    @facing = FACINGS[FACINGS.find_index(@facing)+1] || FACINGS[0]
  end

  def left
    @facing = FACINGS[FACINGS.find_index(@facing)-1] || FACINGS[4]
  end

  def method_missing(command, *args, &block)
    puts "There's no command called #{command}. Try MOVE, LEFT, RIGHT, and REPORT"
  end

  def place_command_warning
    'Start game by giving coordinates and facing of your toy robot. ex: PLACE 0,0,WEST'
  end

  def destructive_move_warning
    puts 'Place do not fall your toy robot to destruction :('
  end
end
