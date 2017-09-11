# frozen_string_literal: true
require 'spec_helper'

describe Facing do
  subject(:name)   { 'EAST' }
  subject(:facing) { described_class.new name }

  describe '#new' do
    it 'should be Facing object' do
      expect(facing).to be_a Facing
    end
    it 'should take name of EAST' do
      expect(facing.name).to eq 'EAST'
    end
  end

  describe '#turn_right' do
    it 'should equals to SOUTH' do
      facing.turn_right
      expect(facing.name).to eq 'SOUTH'
    end
  end

  describe '#turn_left' do
    it 'should equals to NORTH' do
      facing.turn_left
      expect(facing.name).to eq 'NORTH'
    end
  end

  describe '#facing_index' do
    it 'should equals to 1' do
      expect(facing.index).to eq 1
    end
  end

  describe '#to_s' do
    it 'should equals to EAST' do
      expect(facing.to_s).to eq 'EAST'
    end
  end
end
