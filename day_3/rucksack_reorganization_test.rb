require 'minitest/autorun'
require_relative 'rucksack_reorganization'

class RucksackReoganizationTest < Minitest::Test
  def test_only_one_rucksack_letters
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal ['p'], rucksack_reorganization.letters
  end

  def test_only_one_rucksack_score
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal 16, rucksack_reorganization.score
  end

  def test_all_rucksacks_letters
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal ['p', 'L', 'P', 'v', 't', 's'], rucksack_reorganization.letters
  end

  def test_all_rucksacks_score
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal 157, rucksack_reorganization.score
  end

  def test_all_rucksacks_new_organisation_letters
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal ['r', 'Z'], rucksack_reorganization.new_organisation_letters
  end

  def test_all_rucksacks_new_organisation_score
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw\n"
    rucksack_reorganization = RucksackReoganization.new(input)
    assert_equal 70, rucksack_reorganization.new_score
  end
end