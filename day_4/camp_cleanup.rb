class CampCleanup
  class << self
    def fully_contains?(input)
      new(input)
        .fully_contains
    end

    def count_first_part(input)
      new(input)
        .count_first_part
    end
  end

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def fully_contains
    input
      .lines(chomp: true)
      .map { |line| one_section_contain_other_section?(line) }
  end

  def count_first_part
    fully_contains
      .count(true)
  end

  private

  def one_section_contain_other_section?(sections)
    section_first, section_two = sections.split(',')
    first_start, first_end = section_first.split('-')
    second_start, second_end = section_two.split('-')

    (first_start <= second_start && second_end <= first_end) ||
      (second_start <= first_start && first_end <= second_end)
  end
end
