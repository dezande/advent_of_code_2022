class Round
  class << self
    def score(line)
      new(line).score
    end

    def new_score(line)
      new(line).new_score
    end
  end
  attr_reader :line

  FIRST_PLAYER_CONVERTISSOR = {
    'A' => :rock,
    'B' => :paper,
    'C' => :scissors
  }.freeze

  SECOND_PLAYER_CONVERTISSOR = {
    'X' => :rock,
    'Y' => :paper,
    'Z' => :scissors
  }.freeze

  END_ROUND_CONVERTISSOR = {
    'X' => :lose,
    'Y' => :none,
    'Z' => :win
  }.freeze

  SCORE_SHAPE = {
    rock: 1,
    paper: 2,
    scissors: 3
  }.freeze

  SCORE_OUTCOME = {
    lose: 0,
    none: 3,
    win: 6
  }.freeze

  def initialize(line)
    @line = line
  end

  def result
    if first_player == second_player
      :none
    elsif first_win?
      :lose
    else
      :win
    end
  end

  def score
    SCORE_SHAPE.fetch(second_player) + SCORE_OUTCOME.fetch(result)
  end

  def shape_choose
    case end_round
    when :lose
      shape_for_lose
    when :win
      shape_for_win
    else
      first_player
    end
  end

  def new_score
    SCORE_OUTCOME.fetch(end_round) + SCORE_SHAPE.fetch(shape_choose)
  end

  private

  def first_win?
    (first_player == :rock && second_player == :scissors) ||
      (first_player == :paper && second_player == :rock) ||
      (first_player == :scissors && second_player == :paper)
  end

  def first_player
    FIRST_PLAYER_CONVERTISSOR
      .fetch(line[0])
  end

  def second_player
    SECOND_PLAYER_CONVERTISSOR
      .fetch(line[-1])
  end

  def end_round
    END_ROUND_CONVERTISSOR
      .fetch line[-1]
  end

  def shape
    SCORE_SHAPE.keys
  end

  def shape_first_player_index
    shape.index(first_player)
  end

  def shape_for_win
    shape[(shape_first_player_index + 1) % 3]
  end

  def shape_for_lose
    shape[(shape_first_player_index + 2) % 3]
  end
end
