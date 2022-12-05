class SupplyStacks
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def stacks
    crate.stacks
  end

  def top_stacks
    crate.top_stacks
  end

  def run
    procedures.each do |procedure|
      crate.run(
        move: procedure[:move],
        from: procedure[:from],
        to: procedure[:to]
      )
    end
  end

  def run_crate_mover_9001
    procedures.each do |procedure|
      crate.run_crate_mover_9001(
        move: procedure[:move],
        from: procedure[:from],
        to: procedure[:to]
      )
    end
  end

  def procedures
    input
      .split("\n\n")
      .last
      .lines(chomp: true)
      .map { |line|  line.scan(/\d+/) }
      .map do |line|
        {
          move: line[0].to_i,
          from: line[1].to_i,
          to: line[2].to_i
        }
      end
  end

  private

  def crate
    @crate ||= Crate.new(input_stacks)
  end


  def input_stacks
    input.split("\n\n").first
  end
end

class Crate
  attr_reader :input, :stacks

  def initialize(input)
    @input = input
    @stacks ||= StacksBuilder.new(input).stacks
  end

  def run(move:, from:, to:)
    (0...move).each do |_|
      @stacks[to - 1] << stacks[from - 1].pop
    end
  end

  def run_crate_mover_9001(move:, from:, to:)
    if move == 1
      @stacks[to - 1] << stacks[from - 1].pop
    else
      @stacks[to - 1] += stacks[from - 1].pop(move)
    end
  end

  def top_stacks
    stacks.map(&:last)
  end
end

class StacksBuilder
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def stacks
    return @stacks if defined?(@stacks)

    @stacks = Array.new(number_stack) { [] }
    add_stash
    @stacks
  end

  private

  def add_stash
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
      .map { |row| row.scan(/\w/).first }
      .each_with_index do |letter, idx|
        @stacks[idx] << letter unless letter.nil?
      end
  end

  def initialize_stack
    
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