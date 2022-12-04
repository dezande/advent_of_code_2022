class CalorieCounting
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def max
    total_by_day.max
  end

  def total_by_day
    input
      .map(&:to_i)
      .each_slice(3)
      .to_a
      .map(&:sum)
  end
end