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

    def overlaps?(input)
      new(input).overlaps
    end

    def count_second_part(input)
      new(input)
        .count_second_part
    end
  end

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def fully_contains
    input
      .lines(chomp: true)
      .map { |line| Section.new(line).fully_contain? }
  end

  def overlaps
    input
      .lines(chomp: true)
      .map { |line| Section.new(line).overlap? }
  end

  def count_first_part
    fully_contains
      .count(true)
  end

  def count_second_part
    overlaps.count(true)
  end
end

class Section
  attr_reader :sections

  def initialize(sections)
    @sections = sections
  end

  def fully_contain?
    intersection == first_section ||  intersection == second_section
  end

  def overlap?
    union == section_one_and_two && section_one_and_two_max_min >= section_one_and_two_min_max
  end

  private

  def intersection
    first_section.intersection(second_section)
  end

  def union 
    first_section
      .union(second_section)
      .sort
  end

  def first_section
    build_section(sections.split(',').first)
  end

  def second_section
    build_section(sections.split(',').last)
  end

  def section_one_and_two
    (section_one_and_two_min..section_one_and_two_max).to_a
  end

  def section_one_and_two_min
    [
      sections.split(',').first.split('-').min,
      sections.split(',').last.split('-').min
    ].min
  end

  def section_one_and_two_min_max
    [
      sections.split(',').first.split('-').min,
      sections.split(',').last.split('-').min
    ].max
  end

  def section_one_and_two_max
    [
      sections.split(',').first.split('-').max,
      sections.split(',').last.split('-').max
    ].max
  end

  def section_one_and_two_max_min
    [
      sections.split(',').first.split('-').max,
      sections.split(',').last.split('-').max
    ].min
  end

  def build_section(start_end_section)
    section_start, section_end = start_end_section.split('-')
    (section_start..section_end).to_a
  end
end
