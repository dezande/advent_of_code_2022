require_relative 'supply_stacks'

input = File.read('input.txt')
supply_stacks = SupplyStacks.new(input)
supply_stacks.run
puts supply_stacks.top_stacks.join