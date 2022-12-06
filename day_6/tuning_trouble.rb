class Tuningtrouble
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def first_marker
    (0...input.size)
      .each do |i|
        if input[i, 4].chars.uniq.count == 4
          return i + 4 
        end
      end
  end

  def first_marker_second_part
    (0...input.size)
      .each do |i|
        if input[i, 14].chars.uniq.count == 14
          return i + 14 
        end
      end
  end
end