class CalorieCounting
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def max
    calorie_by_elf.max
  end

  def top_max_sum
    calorie_by_elf.max(3).sum
  end

  private

  def calorie_by_elf
    input
      .lines(chomp: true)
      .map(&:to_i)
      .chunk_while {|i, j| j != 0 }
      .map(&:sum)
  end
end