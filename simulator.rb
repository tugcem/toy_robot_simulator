# frozen_string_literal: true
require './simulator/toy_robot.rb'
require './simulator/table.rb'
# Simulator of Toy Robot which initializes Toy Robot
# and Table to interpret user inputs to manipulate Toy Robot
module Simulator
  puts 'Start game by position and facing of toy robot. ex: PLACE 0,0,EAST'

  toy_robot = ToyRobot.new Table.new(5, 5)

  ARGF.each do |line|
    command = line.split(' ', 2)
    toy_robot.send command[0].downcase, command[1]
  end
end
