require 'minitest/autorun'
require_relative 'supply_stacks'

class SupplyStacksTest < Minitest::Test
  def input
    <<-END
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2 
    END
  end

  def test_initialize_stacks
    supply_stacks = SupplyStacks.new(input)
    stacks = [
      %w(Z N),
      %w(M C D),
      %w(P)
    ]
    assert_equal(supply_stacks.stacks, stacks)
  end

  def test_initialize_procedures
    supply_stacks = SupplyStacks.new(input)
    procedures = [
      {move: 1, from: 2, to: 1},
      {move: 3, from: 1, to: 3},
      {move: 2, from: 2, to: 1},
      {move: 1, from: 1, to: 2}
    ]
    assert_equal(supply_stacks.procedures, procedures)
  end

  def test_example
    supply_stacks = SupplyStacks.new(input)
    supply_stacks.run
    assert_equal(%w(C M Z), supply_stacks.top_stacks)
  end

  def test_example_with_crate_mover_9001
    supply_stacks = SupplyStacks.new(input)
    supply_stacks.run_crate_mover_9001
    assert_equal(%w(M C D), supply_stacks.top_stacks)
  end
end

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

  def test_move_one_time
    crate = Crate.new(input)
    stacks = [
      %w(Z N D),
      %w(M C),
      %w(P)
    ]
    crate.run(move: 1, from:2, to: 1)
    assert_equal(stacks, crate.stacks)
  end

  def test_move_one_with_crate_mover_9001
    crate = Crate.new(input)
    stacks = [
      %w(Z N D),
      %w(M C),
      %w(P)
    ]
    crate.run_crate_mover_9001(move: 1, from:2, to: 1)
    assert_equal(stacks, crate.stacks)
  end

  def test_move_two_time
    crate = Crate.new(input)
    stacks = [
      %w(Z N D C),
      %w(M),
      %w(P)
    ]
    crate.run(move: 2, from:2, to: 1)
    assert_equal(stacks, crate.stacks)
  end

  def test_move_two_with_crate_mover_9001
    crate = Crate.new(input)
    stacks = [
      %w(Z N C D),
      %w(M),
      %w(P)
    ]
    crate.run_crate_mover_9001(move: 2, from:2, to: 1)
    assert_equal(stacks, crate.stacks)
  end


  def test_give_top_stack
    crate = Crate.new(input)
    assert_equal(%w(N D P), crate.top_stacks)
  end

  def test_example
    crate = Crate.new(input)
    crate.run(move: 1, from: 2, to: 1)
    crate.run(move: 3, from: 1, to: 3)
    crate.run(move: 2, from: 2, to: 1)
    crate.run(move: 1, from: 1, to: 2)
    assert_equal(%w(C M Z), crate.top_stacks)
  end

  def test_example_with_crate_mover_9001
    crate = Crate.new(input)
    crate.run_crate_mover_9001(move: 1, from: 2, to: 1)
    crate.run_crate_mover_9001(move: 3, from: 1, to: 3)
    crate.run_crate_mover_9001(move: 2, from: 2, to: 1)
    crate.run_crate_mover_9001(move: 1, from: 1, to: 2)
    assert_equal(%w(M C D), crate.top_stacks)
  end
end