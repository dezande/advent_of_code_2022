require_relative 'supply_stacks'

input = File.read('input.txt')
supply_stacks = SupplyStacks.new(input)
supply_stacks.run
puts supply_stacks.top_stacks.join

supply_stacks_2 = SupplyStacks.new(input)
supply_stacks_2.run_crate_mover_9001
puts supply_stacks_2.top_stacks.join
