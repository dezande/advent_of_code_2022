require 'minitest/autorun'
require_relative 'supply_stacks'

class CrateTest < Minitest::Test
  def input
    <<-END
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 
    END
  end

  def test_read_the_inputs
    crate = Crate.new(input)
    stacks = [
      %w(Z N),
      %w(M C D),
      %w(P)
    ]
    assert_equal(crate.stacks, stacks)
  end
end