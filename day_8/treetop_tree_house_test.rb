require 'minitest/autorun'
require_relative 'treetop_tree_house'

class TreetopTreeHouseTest < Minitest::Test
  def test_number_visible
    data = "30373\n"
    data += "25512\n"
    data += "65332\n"
    data += "33549\n"
    data += '35390'

    treetop_tree_house = TreetopTreeHouse.new(data)
    assert_equal 21, treetop_tree_house.trees_visible
  end

  def test_number_small
    data = "11\n"
    data += '11'

    treetop_tree_house = TreetopTreeHouse.new(data)
    assert_equal 4, treetop_tree_house.trees_visible
  end

  def test_score_max
    data = "30373\n"
    data += "25512\n"
    data += "65332\n"
    data += "33549\n"
    data += '35390'

    treetop_tree_house = TreetopTreeHouse.new(data)
    assert_equal 8, treetop_tree_house.score_max
  end
end
