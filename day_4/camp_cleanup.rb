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
    first, two = sections.split(',')
    section_one = build_section(first)
    section_two = build_section(two)

    intersection = section_one.intersection(section_two)

    (intersection.first == section_one.first && intersection.last == section_one.last) ||
      (intersection.first == section_two.first && intersection.last == section_two.last)
  end

  def build_section(start_end_section)
    section_start, section_end = start_end_section.split('-')
    (section_start..section_end).to_a
  end
end
