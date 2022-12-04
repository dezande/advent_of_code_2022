require 'minitest/autorun'
require_relative 'calorie_counting'

class CalorieCountingTest < Minitest::Test
  def test_count_1_elf
    input = "2027\n1630\n4699\n\n"
    assert_equal 8356, CalorieCounting.new(input).max
  end

  def test_count_1_elf_with_2_values
    input = "1689\n5509\n"
    assert_equal 7198, CalorieCounting.new(input).max
  end

  def test_count_2_elfs
    input = "2027\n1630\n4699\n\n3860\n\n5686\n1178\n"
    assert_equal 8356, CalorieCounting.new(input).max
  end

  def test_example
    input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000\n"
    assert_equal 24000, CalorieCounting.new(input).max
  end

  def test_example_for_second_exer
    input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000\n"
    assert_equal 45000, CalorieCounting.new(input).top_max_sum
  end
end