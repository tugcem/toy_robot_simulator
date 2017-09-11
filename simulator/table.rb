# frozen_string_literal: true
# Table for toy robot to spend time on it.
# Table can check whether any proposed position fall toy robot
# to destruction or not and warn user about that
class Table
  attr_accessor :width, :length

  def initialize(width, length)
    @width = width
    @length = length
  end

  def on_table?(x, y)
    (0...@length).cover?(x) && (0...@width).cover?(y) || not_on_table_error
  end

  def not_on_table_error
    raise 'Please do not fall your toy robot to destruction :('
  end
end
