require './toy_robot.rb'
require './toy_robot/report.rb'

describe Report do

  let (:toy_robot) { ToyRobot.new({x: 2, y: 3, facing: 'NORTH'}) }
  let (:second_toy_robot) { ToyRobot.new({x: 1, y: 5, facing: 'EAST'}) }

  describe '#report' do
    context 'when position is 2,3 and facing NORTH' do
      it 'prints OUTPUT: 2,3,NORTH' do
        expect { toy_robot.report }.to output("OUTPUT: 2,3,NORTH\n").to_stdout
      end
    end

    context 'when position is 2,3 and facing EAST' do
      it 'prints OUTPUT: 2,3,EAST' do
        expect { second_toy_robot.report }.to output("OUTPUT: 1,5,EAST\n").to_stdout
      end
    end
  end
end