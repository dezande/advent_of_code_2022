require 'minitest/autorun'
require_relative 'camp_cleanup'

class CampCleanupTest < Minitest::Test
  def test_first_pair
    input = "2-4,6-8"
    assert_equal false, CampCleanup.fully_contains?(input).first
  end

  def test_second_pair
    input = "2-3,4-5"
    assert_equal false, CampCleanup.fully_contains?(input).first
  end

  def test_third_pair
    input = "5-7,7-9"
    assert_equal false, CampCleanup.fully_contains?(input).first
  end

  def test_fourth_pair
    input = "2-8,3-7"
    assert CampCleanup.fully_contains?(input).first
  end

  def test_fifth_pair
    input = "6-6,4-6"
    assert CampCleanup.fully_contains?(input).first
  end

  def test_sith_pair
    input = "2-6,4-8"
    assert_equal false, CampCleanup.fully_contains?(input).first
  end

  def test_all_pair
    input = "2-4,6-8\n2-3,4-5\n5-7,7-9\n2-8,3-7\n6-6,4-6\n2-6,4-8\n"
    assert_equal [false, false, false, true, true, false], CampCleanup.fully_contains?(input)
  end

  def test_number_pair
    input = "2-4,6-8\n2-3,4-5\n5-7,7-9\n2-8,3-7\n6-6,4-6\n2-6,4-8\n"
    assert_equal 2, CampCleanup.count_first_part(input)
  end
end
