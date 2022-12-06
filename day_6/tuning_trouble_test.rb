require 'minitest/autorun'
require_relative 'tuning_trouble'

class TuningtroubleTest < Minitest::Test
  def test_first_example
    tuning_trouble = Tuningtrouble.new('mjqjpqmgbljsphdztnvjfqwrcgsmlb')
    assert_equal(7, tuning_trouble.first_marker)
  end

  def test_second_example
    tuning_trouble = Tuningtrouble.new('bvwbjplbgvbhsrlpgdmjqwftvncz')
    assert_equal(5, tuning_trouble.first_marker)
  end

  def test_third_example
    tuning_trouble = Tuningtrouble.new('nppdvjthqldpwncqszvftbrmjlhg')
    assert_equal(6, tuning_trouble.first_marker)
  end

  def test_fouth_example
    tuning_trouble = Tuningtrouble.new('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')
    assert_equal(10, tuning_trouble.first_marker)
  end

  def test_fifth_example
    tuning_trouble = Tuningtrouble.new('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')
    assert_equal(11, tuning_trouble.first_marker)
  end

  def test_first_example_second_part
    tuning_trouble = Tuningtrouble.new('mjqjpqmgbljsphdztnvjfqwrcgsmlb')
    assert_equal(19, tuning_trouble.first_marker_second_part)
  end

  def test_second_example_second_part
    tuning_trouble = Tuningtrouble.new('bvwbjplbgvbhsrlpgdmjqwftvncz')
    assert_equal(23, tuning_trouble.first_marker_second_part)
  end

  def test_third_example_second_part
    tuning_trouble = Tuningtrouble.new('nppdvjthqldpwncqszvftbrmjlhg')
    assert_equal(23, tuning_trouble.first_marker_second_part)
  end

  def test_fouth_example_second_part
    tuning_trouble = Tuningtrouble.new('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')
    assert_equal(29, tuning_trouble.first_marker_second_part)
  end

  def test_fifth_example_second_part
    tuning_trouble = Tuningtrouble.new('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')
    assert_equal(26, tuning_trouble.first_marker_second_part)
  end
end