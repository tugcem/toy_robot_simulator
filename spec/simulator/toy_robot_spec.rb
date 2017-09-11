# frozen_string_literal: true
require 'spec_helper'

describe ToyRobot do
  subject(:table)                  { Table.new 4, 4 }
  subject(:toy_robot)              { described_class.new table }
  subject(:invalid_position_input) { '9,0,EAST' }
  subject(:invalid_facing_input)   { '0,0,WEAST' }
  subject(:valid_input)            { '0,0,EAST' }

  describe '#new' do
    it 'should be ToyRobot object' do
      expect(toy_robot).to be_a ToyRobot
    end
  end

  describe '#place' do
    context 'with invalid input' do
      it 'should not create Position object' do
        toy_robot.place(invalid_position_input)
        expect(toy_robot.position).to be_nil
      end
    end
    context 'with valid input' do
      it 'should create Position object' do
        toy_robot.place(valid_input)
        expect(toy_robot.position).to be_a Position
      end
    end
  end

  describe '#move' do
    context 'if not placed yet' do
      it 'should print warning message' do
        expect(toy_robot).to receive(:not_placed_warning)
        toy_robot.move
      end
    end
    context 'if placed' do
      it 'should print warning message if it cannot' do
        toy_robot.place('3,0,EAST')
        expect(table).to receive(:not_on_table_error)
        toy_robot.move
      end
      it 'should move if it can' do
        toy_robot.place(valid_input)
        toy_robot.move
        expect(toy_robot.position.x).to eq 1
      end
    end
  end

  describe '#left' do
    context 'if not placed yet' do
      it 'should print warning message' do
        expect(toy_robot).to receive(:not_placed_warning)
        toy_robot.left
      end
    end
    context 'if placed' do
      it 'should turn left' do
        toy_robot.place(valid_input)
        expect(toy_robot.position.facing).to receive(:turn_left)
        toy_robot.left
      end
    end
  end

  describe '#right' do
    context 'if not placed yet' do
      it 'should print warning message' do
        expect(toy_robot).to receive(:not_placed_warning)
        toy_robot.right
      end
    end
    context 'if placed' do
      it 'should turn right' do
        toy_robot.place(valid_input)
        expect(toy_robot.position.facing).to receive(:turn_right)
        toy_robot.right
      end
    end
  end

  describe '#report' do
    context 'if not placed yet' do
      it 'should print warning message' do
        expect(toy_robot).to receive(:not_placed_warning)
        toy_robot.report
      end
    end
    context 'if placed' do
      it 'should print position' do
        toy_robot.place(valid_input)
        expect(toy_robot.position).to receive(:to_s)
        toy_robot.report
      end
    end
  end

  describe '#missing' do
    it 'should print warning that given command is not valid' do
      expect(toy_robot).to receive(:method_missing)
      toy_robot.missing
    end
  end
end
