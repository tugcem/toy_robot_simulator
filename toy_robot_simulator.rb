require './place.rb'
require './toy_robot.rb'

class ToyRobotSimulator
  extend Place

  #game starts...
  puts 'Start game by writing coordinates and facing of toy robot. ex: PLACE 0,0,WEST'

  #instantiation of toy_robot class
  place_of_toy_robot = place_toy_robot gets
  toy_robot = ToyRobot.new(place_of_toy_robot)

  #getting line of commands from user
  while line = gets

    #convert line command to method name of toy_robot class
    method = line.split("\n")[0].downcase

    #and call given method
    toy_robot.send method
  end
end