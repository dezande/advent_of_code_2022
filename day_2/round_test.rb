require 'minitest/autorun'
require_relative 'round'

class RoundTest < Minitest::Test
  def test_first_round_winner
    round = Round.new('A Y')
    assert_equal :win, round.result 
  end

  def test_first_round_score
    round = Round.new('A Y')
    assert_equal 8, round.score
  end

  def test_first_round_new_shape
    round = Round.new('A Y')
    assert_equal :rock, round.shape_choose
  end

  def test_first_round_new_score
    round = Round.new('A Y')
    assert_equal 4, round.new_score
  end

  def test_second_round_winner
    round = Round.new('B X')
    assert_equal :lose, round.result 
  end

  def test_second_round_score
    round = Round.new('B X')
    assert_equal 1, round.score
  end

  def test_first_round_new_shape
    round = Round.new('B X')
    assert_equal :rock, round.shape_choose
  end

  def test_second_round_new_score
    round = Round.new('B X')
    assert_equal 1, round.new_score
  end

  def test_third_round_winner
    round = Round.new('C Z')
    assert_equal :none, round.result 
  end

  def test_third_round_score
    round = Round.new('C Z')
    assert_equal 6, round.score
  end

  def test_third_round_new_shape
    round = Round.new('A Y')
    assert_equal :rock, round.shape_choose
  end

  def test_third_round_new_score
    round = Round.new('C Z')
    assert_equal 7, round.new_score
  end
end
