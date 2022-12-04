require_relative 'round'

class RockPaperScissors
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def total_score
    rounds
      .map { |line| Round.score(line) }
      .sum
  end

  def total_new_score
    rounds
      .map { |line| Round.new_score(line) }
      .sum
  end

  private
  
  def rounds
    input
      .lines(chomp: true)
  end
end