# frozen_string_literal: true
require 'spec_helper'

describe Position do
  subject(:input)    { %w(2 2 EAST) }
  subject(:position) { described_class.new input }

  describe '#new' do
    it 'should be Position object' do
      expect(position).to be_a Position
    end
    it 'should have x value of 0' do
      expect(position.x).to eq 2
    end
    it 'should have y value of 0' do
      expect(position.y).to eq 2
    end
    it 'should have facing value of Facing object' do
      expect(position.facing).to be_a Facing
    end
    it 'should have facing value of EAST' do
      expect(position.facing.name).to eq 'EAST'
    end
  end

  describe '#move' do
    it 'should call move_east' do
      expect(position).to receive(:move_east)
      position.move
    end
  end

  describe '#to_s' do
    it 'should print position' do
      expect(position.to_s).to eq '2,2,EAST'
    end
  end

  describe '#move_north' do
    it 'should change position to (2,3)' do
      position.send(:move_north)
      expect(position.y).to eq 3
    end
  end

  describe '#move_south' do
    it 'should change the position to (2,1)' do
      position.send(:move_south)
      expect(position.y).to eq 1
    end
  end

  describe '#move_east' do
    it 'should change the position to (3,2)' do
      position.send(:move_east)
      expect(position.x).to eq 3
    end
  end

  describe '#move_west' do
    it 'should change the position to (1,2)' do
      position.send(:move_west)
      expect(position.x).to eq 1
    end
  end
end
