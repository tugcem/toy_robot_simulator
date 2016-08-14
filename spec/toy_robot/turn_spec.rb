require './toy_robot.rb'
require './toy_robot/turn.rb'

describe Turn do

  let (:toy_robot) { ToyRobot.new({x: 0, y: 0, facing: 'NORTH'}) }
  let (:second_toy_robot) { ToyRobot.new({x: 0, y: 0, facing: 'SOUTH'}) }

  describe '#right' do
    context 'when facing is NORTH' do
      it 'sets facing EAST' do
        toy_robot.right
        expect(toy_robot.facing).to eq 'EAST'
      end
    end

    context 'when facing is SOUTH' do
      it 'sets facing WEST' do
        second_toy_robot.right
        expect(second_toy_robot.facing).to eq 'WEST'
      end
    end
  end

  describe '#left' do
    context 'when facing is NORTH' do
      it 'sets facing WEST' do
        toy_robot.left
        expect(toy_robot.facing).to eq 'WEST'
      end
    end

    context 'when facing is SOUTH' do
      it 'sets facing EAST' do
        second_toy_robot.left
        expect(second_toy_robot.facing).to eq 'EAST'
      end
    end
  end

  describe '#current_facing_index' do
    context 'when facing is NORTH' do
      it 'returns 0' do
        expect(toy_robot.current_facing_index).to eq 0
      end
    end

    context 'when facing is SOUTH' do
      it 'returns 2' do
        expect(second_toy_robot.current_facing_index).to eq 2
      end
    end
  end
end