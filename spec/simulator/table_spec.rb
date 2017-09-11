# frozen_string_literal: true
require 'spec_helper'

describe Table do
  subject(:width)  { 8 }
  subject(:length) { 9 }
  subject(:table)  { described_class.new width, length }

  describe '#new' do
    it 'should be Table object' do
      expect(table).to be_a Table
    end
    it 'should take width of 8 and length of 9' do
      expect(table.width).to eq 8
      expect(table.length).to eq 9
    end
  end

  describe '#on_table?' do
    it 'should be truthy if given position is (8, 7) ' do
      expect(table.on_table?(8, 7)).to be_truthy
    end
    it 'should raise error if given position is (10, 9) ' do
      not_on_table_error = 'Please do not fall your toy robot to destruction :('
      expect { table.on_table?(9, 10) }.to raise_error not_on_table_error
    end
  end
end
