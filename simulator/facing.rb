# frozen_string_literal: true
# Facing of robot according to table
class Facing
  attr_accessor :name

  FACINGS = %w(NORTH EAST SOUTH WEST).freeze

  def initialize(name)
    @name = name
  end

  def turn_right
    @name = FACINGS.rotate[index]
  end

  def turn_left
    @name = FACINGS.rotate(-1)[index]
  end

  def index
    FACINGS.find_index(@name)
  end

  def to_s
    @name.to_s
  end
end
