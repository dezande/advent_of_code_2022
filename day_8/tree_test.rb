require 'minitest/autorun'
require_relative 'tree'

class TreeTest < Minitest::Test
  MAP = [
    [3, 0, 3, 7, 3],
    [5, 5, 5, 6, 9],
    [6, 5, 3, 3, 2],
    [4, 3, 5, 4, 2],
    [3, 2, 3, 9, 0]
  ]

  def test_first_line
    tree = Tree.new(x: 0, y: 2, map: MAP)
    assert tree.first_line?
  end

  def test_first_column
    tree = Tree.new(x: 3, y: 0, map: MAP)
    assert tree.first_column?
  end

  def test_last_line
    tree = Tree.new(x: 4, y: 2, map: MAP)
    assert tree.last_line?
  end

  def test_last_column
    tree = Tree.new(x: 3, y: 4, map: MAP)
    assert tree.last_column?
  end

  def test_east
    map = [
      [2, 2, 2],
      [1, 2, 2],
      [2, 2, 2]
    ]
    tree = Tree.new(x: 1, y: 1, map:)
    assert tree.east_visible?
  end

  def test_west
    map = [
      [2, 2, 2],
      [2, 2, 1],
      [2, 2, 2]
    ]
    tree = Tree.new(x: 1, y: 1, map:)
    assert tree.west_visible?
  end

  def test_north
    map = [
      [2, 1, 2],
      [2, 2, 2],
      [2, 2, 2]
    ]
    tree = Tree.new(x: 1, y: 1, map:)
    assert tree.north_visible?
  end

  def test_south
    map = [
      [2, 2, 2],
      [2, 2, 2],
      [2, 1, 2]
    ]
    tree = Tree.new(x: 1, y: 1, map:)
    assert tree.south_visible?
  end

  def test_invalid
    map = [
      [2, 2, 2],
      [2, 2, 2],
      [2, 2, 2]
    ]
    tree = Tree.new(x: 1, y: 1, map:)
    refute tree.visible?
  end
end
