require 'minitest/autorun'
require_relative 'calorie_counting'

class CalorieCountingTest < Minitest::Test
  def test_count_1_elf
    input = ['210', '200', '300']
    assert_equal [710], CalorieCounting.new(input).total_by_day
  end

  def test_count_1_elf_without_calories
    input = ['', '', '']
    assert_equal [0], CalorieCounting.new(input).total_by_day
  end

  def test_count_1_elf_with_only_2_values
    input = ['200', '200']
    assert_equal [400], CalorieCounting.new(input).total_by_day
  end

  def test_count_2_elfs
    input = ['210', '', '200', '300']
    assert_equal [410, 300], CalorieCounting.new(input).total_by_day
  end

  def test_count_example
    input = ['1000', '2000', '3000', '', '4000', '', '5000', '6000', '', '7000', '8000', '9000','', '10000']
    assert_equal [6000, 4000, 11000, 24000, 10000], CalorieCounting.new(input).total_by_day
  end

  def test_max
    input = ['1000', '2000', '3000', '', '4000', '', '5000', '6000', '', '7000', '8000', '9000','', '10000']
    assert_equal 24000, CalorieCounting.new(input).max
  end
end