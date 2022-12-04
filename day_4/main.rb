require_relative 'camp_cleanup'

input = File.read('input.txt')
camp_cleanup = CampCleanup.new(input)
puts CampCleanup.count_first_part(input)
puts CampCleanup.count_second_part(input)