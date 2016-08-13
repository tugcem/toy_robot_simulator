require './toy_robot.rb'

class ToyRobotSimulator

  #game starts...
  puts 'Start game by writing coordinates and facing of toy robot. ex: PLACE 0,0,WEST'

  #instantiation of toy_robot class
  toy_robot = ToyRobot.new(gets)

  #getting line of commands from user
  while line = gets

    #convert line command to method name of toy_robot class
    method = line.split("\n")[0].downcase

    #and call given method
    toy_robot.send method
  end
end