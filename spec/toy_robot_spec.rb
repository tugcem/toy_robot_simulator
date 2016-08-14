require './toy_robot.rb'

describe ToyRobot do
  let(:toy_robot) { ToyRobot.new({x: 1, y: 1, facing: 'NORTH'}) }

  describe 'when toy_robot is on 1,1 and facing NORTH' do
    context '#initialize' do
      it 'it sets class variables' do
        expect(toy_robot.x).to eq 1
        expect(toy_robot.y).to eq 1
        expect(toy_robot.facing).to eq 'NORTH'
      end
    end

    context '#move' do
      it 'it moves to 1,1' do
        toy_robot.move
        expect(toy_robot.x).to eq 1
        expect(toy_robot.y).to eq 2
      end
    end

    context '#left' do
      it 'turns to WEST' do
        toy_robot.left
        expect(toy_robot.facing).to eq 'WEST'
      end
    end

    context '#right' do
      it 'turns to EAST' do
        toy_robot.right
        expect(toy_robot.facing).to eq 'EAST'
      end
    end

    context '#report' do
      it 'prints OUTPUT: 1,1,NORTH ' do
        expect { toy_robot.report }.to output("OUTPUT: 1,1,NORTH\n").to_stdout
      end
    end

    context '#asd' do
      it 'prints available methods' do
        expect { toy_robot.asd }.to output("There's no command called asd. Try MOVE, LEFT, RIGHT, and REPORT\n").to_stdout
      end
    end
  end
end