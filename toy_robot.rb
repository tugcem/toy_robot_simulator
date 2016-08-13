require './toy_robot/move.rb'
require './toy_robot/turn.rb'
require './toy_robot/place.rb'
require './toy_robot/report.rb'

class ToyRobot

  include Move
  include Turn
  include Place
  include Report

  #available position limit and facing on the table
  SOUTH_WEST_MOST_CORNER = 0
  NORTH_EAST_MOST_CORNER = 5
  FACINGS                = %w(NORTH EAST SOUTH WEST)

  attr_accessor :x, :y, :facing

  #initializing toy_robot by using place_toy_robot method from place module
  def initialize stdin
    toy_robot = place_toy_robot stdin
    @x        = toy_robot[:x]
    @y        = toy_robot[:y]
    @facing   = toy_robot[:facing]
  end

  #if any invalid command comes from stdin, prints available commands string
  def method_missing(command, *args, &block)
    puts "There's no command called #{command}. Try MOVE, LEFT, RIGHT, and REPORT"
  end
end
