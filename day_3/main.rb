require_relative 'rucksack_reorganization'

input = File.read('input.txt')
rucksack_reorganization = RucksackReoganization.new(input)
puts rucksack_reorganization.score
puts rucksack_reorganization.new_score