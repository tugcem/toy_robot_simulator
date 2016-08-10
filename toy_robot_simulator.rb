require './toy_robot.rb'

class ToyRobotSimulator
  puts 'Start game by giving coordinates and facing of toy robot. ex: PLACE 0,0,WEST'
  toy_robot = ToyRobot.new(gets)

  while a = gets
    method = a.split("\n")[0].downcase
    toy_robot.send method
  end
end