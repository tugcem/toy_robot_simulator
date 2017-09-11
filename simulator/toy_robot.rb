# frozen_string_literal: true
require './simulator/position.rb'
require './simulator/facing.rb'
# Toy Robot object which can be placed on table, moved on it without falling,
# turned to left and right and asked for its current position.
class ToyRobot
  attr_accessor :table, :position

  MOVEMENTS = {
    "NORTH": [0, +1],
    "SOUTH": [0, -1],
    "EAST":  [1, 0],
    "WEST": [-1, 0]
  }.freeze

  def initialize(table)
    @table = table
  end

  def place(input)
    @position = Position.new parse input if valid_position? input
  end

  def move(*)
    @position.move if placed? && can_move
  end

  def left(*)
    facing.turn_left if placed?
  end

  def right(*)
    facing.turn_right if placed?
  end

  def report(*)
    puts @position.to_s if placed?
  end

  def method_missing(command, *)
    if command
      puts "There's no command #{command} Ex: REPORT, PLACE, MOVE, LEFT, RIGHT."
    else
      super
    end
  end

  def respond_to_missing?
    super
  end

  private

  def parse(input)
    input.split(/[\s,]/)
  end

  def valid_position?(input)
    position = parse input
    validate_coordinates(position[0..1]) && validate_facing(position[2])
  end

  def validate_coordinates(coordinates)
    x = Integer coordinates[0]
    y = Integer coordinates[1]

    @table.on_table?(x, y)
  rescue StandardError
    width  = @table.width
    length = @table.length
    puts "Place your toy robot on table, which is #{width}x#{length}"
  end

  def validate_facing(name)
    Facing::FACINGS.include?(name) || facing_error
  end

  def facing_error
    puts 'Please choose one the valid facings ex: NORTH, EAST, SOUTH, WEST'
  end

  def can_move
    x = @position.x
    y = @position.y
    begin
      movement = MOVEMENTS[facing.name.to_sym]
      @table.on_table?(x + movement[0], y + movement[1])
    rescue StandardError => e
      puts e
    end
  end

  def placed?
    @position || not_placed_warning
  end

  def not_placed_warning
    puts 'Please first place your toy robot. Ex: PLACE 0,0,EAST'
  end

  def facing
    @facing ||= @position.facing
  end
end
