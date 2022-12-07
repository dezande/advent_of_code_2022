require_relative 'tuning_trouble'

input = File.read('input.txt')
tuning_trouble = Tuningtrouble.new(input)
puts tuning_trouble.first_marker
puts tuning_trouble.first_marker_second_part
