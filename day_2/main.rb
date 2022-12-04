require_relative 'rock_paper_scissors'

input = File.read('input.txt')
rock_paper_scissors = RockPaperScissors.new(input)
puts rock_paper_scissors.total_score
puts rock_paper_scissors.total_new_score