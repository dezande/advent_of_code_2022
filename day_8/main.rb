require_relative 'treetop_tree_house'

input = File.read('input.txt')
treetop_tree_house = TreetopTreeHouse.new(input)
puts treetop_tree_house.trees_visible
puts treetop_tree_house.score_max
