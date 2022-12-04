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

  def score
    letters
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
end
