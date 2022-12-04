require_relative 'calorie_counting'

input = File.read('input.txt')
calorie_counting = CalorieCounting.new(input)
puts calorie_counting.max
puts calorie_counting.top_max_sum
