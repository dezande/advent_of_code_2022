require 'minitest/autorun'
require_relative 'rock_paper_scissors'

class RockPaperScissorsTest < Minitest::Test
  def test_first_part
    input = "A Y\nB X\nC Z\n"
    rock_paper_scissors = RockPaperScissors.new(input)
    assert_equal 15, rock_paper_scissors.total_score 
  end

  def test_second_part
    input = "A Y\nB X\nC Z\n"
    rock_paper_scissors = RockPaperScissors.new(input)
    assert_equal 12, rock_paper_scissors.total_new_score 
  end
end