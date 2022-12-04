class RucksackReoganization
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def letters
    input
      .lines(chomp: true)
      .map { |rucksack|  rucksack.chars.each_slice(rucksack.size / 2).map(&:join) }
      .map { |rucksack|  letter(rucksack.first, rucksack.last) }
  end

  def new_organisation_letters
    input
    .lines(chomp: true)
    .each_slice(3)
    .map { |rucksacks| new_letter(rucksacks.first, rucksacks[1], rucksacks[-1]).first }
  end

  def score
    letters
      .map { |letter| alaphabert.index(letter) + 1 }
      .sum
  end

  def new_score
    new_organisation_letters
      .map { |letter| alaphabert.index(letter) + 1 }
      .sum
  end

  private

  def letter(first_compartment, second_compartment)
    (first_compartment.chars & second_compartment.chars).first
  end

  def alaphabert
    ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def new_letter(first_rucksack, second_rucksack, third_rucksack)
    first_rucksack.chars & second_rucksack.chars & third_rucksack.chars
  end
end
