require_relative 'no_space_left_on_device'

input = File.read('input.txt')
no_space_left_on_device = NoSpaceLeftOnDevice.new(input)
puts no_space_left_on_device.part_one
puts no_space_left_on_device.part_two