require './toy_robot.rb'
require './toy_robot/move.rb'

describe Move do

  let (:toy_robot) { ToyRobot.new({x: 1, y: 1, facing: 'EAST'}) }
  let (:second_toy_robot) { ToyRobot.new({x: 2, y: 3, facing: 'SOUTH'}) }
  let (:third_toy_robot) { ToyRobot.new({x: 0, y: 1, facing: 'WEST'}) }
  let (:fourth_toy_robot) { ToyRobot.new({x: 4, y: 5, facing: 'NORTH'}) }

  describe '#move' do
    context 'when position is 1,1 and facing is EAST' do
      it 'sets position to 2,1' do
        toy_robot.move
        expect(toy_robot.x).to eq 2
        expect(toy_robot.y).to eq 1
      end
    end

    context 'when position is 2,3 and facing is SOUTH' do
      it 'sets position to 2,2' do
        second_toy_robot.move
        expect(second_toy_robot.x).to eq 2
        expect(second_toy_robot.y).to eq 2
      end
    end

    context 'when position is 0,1 and facing is WEST' do
      it 'does not move toy robot' do
        expect { third_toy_robot.move }.to output("Please do not fall your toy robot to destruction :(\n").to_stdout
        expect(third_toy_robot.x).to eq 0
        expect(third_toy_robot.y).to eq 1
      end
    end

    context 'when position is 4,5 and facing is NORTH' do
      it 'does not move toy robot' do
        expect { fourth_toy_robot.move }.to output("Please do not fall your toy robot to destruction :(\n").to_stdout
        expect(fourth_toy_robot.x).to eq 4
        expect(fourth_toy_robot.y).to eq 5
      end
    end
  end
end