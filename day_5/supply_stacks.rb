class SupplyStacks
  attr_reader :input

  def initialize(input)
    @input = input
  end

end

class Crate
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def stacks
    return @stacks if defined?(apple)

    build_stacks

    @stacks
  end

  private

  def build_stacks
    initialize_stack

    input
      .lines(chomp: true)
      .reverse
      .slice(1..-1)
      .each { |floor| stack_by_floor(floor) }
  end

  def stack_by_floor(floor)
    floor
      .chars
      .each_slice(4)
      .map(&:join)
      .map { |s| s.scan(/\w/) }
      .map do |s|
        s.each_with_index do |letter, idx|
          next if letter.nil?

          @stacks[idx] << letter
        end
      end
  end

  def initialize_stack
    @stacks = Array.new(number_stack) { [] }
  end

  def number_stack
    input_line_to_array
      .first
      .scan(/\d/)
      .max
      .to_i
  end
  
  def input_line_to_array
    input
      .lines(chomp: true)
      .reverse
  end
end