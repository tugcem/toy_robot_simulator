# frozen_string_literal: true
# Position of toy robot
class Position
  attr_accessor :x, :y, :facing

  def initialize(position)
    @x = Integer position[0]
    @y = Integer position[1]
    @facing = Facing.new(position[2])
  end

  def move
    send "move_#{@facing.name.downcase}"
  end

  def to_s
    @x.to_s + ',' + @y.to_s + ',' + @facing.to_s
  end

  private

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
end
