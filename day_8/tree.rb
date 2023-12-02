class Tree
  class << self
    def visible?(...)
      new(...).visible?
    end
  end

  attr_reader :x, :y, :map

  def initialize(x:, y:, map:)
    @x = x
    @y = y
    @map = map
  end

  def visible?
    first_line? ||
      last_line? ||
      first_column? ||
      last_column? ||
      north_visible? ||
      south_visible? ||
      east_visible? ||
      west_visible? 
  end

  def first_line?
    x.zero?
  end

  def last_line?
    x + 1 == map.size
  end

  def first_column?
    y.zero?
  end

  def last_column?
    y + 1 == map.first.size
  end

  def north_visible?
    trees_north_sizes.max < current_tree_size
  end

  def south_visible?
    trees_south_sizes.max < current_tree_size
  end

  def east_visible?
    trees_east_sizes.max < current_tree_size
  end

  def west_visible?
    trees_west_sizes.max < current_tree_size
  end

  def score_nord
    trees_north_sizes
      .reverse
      .each_with_index do |tree, index|
        return index + 1 if tree >= current_tree_size 
      end
    trees_north_sizes.size
  end

  def score_south
    trees_south_sizes
      .each_with_index do |tree, index|
        return index + 1 if tree >= current_tree_size 
      end
    trees_south_sizes.size
  end

  def score_east
    trees_east_sizes
      .reverse
      .each_with_index do |tree, index|
        return index + 1 if tree >= current_tree_size 
      end
    trees_east_sizes.size
  end

  def score_west
    trees_west_sizes
      .each_with_index do |tree, index|
        return index + 1 if tree >= current_tree_size 
      end
    trees_west_sizes.size
  end

  def score_total
    score_nord *
      score_south *
      score_east *
      score_west
  end

  private

  def current_tree_size
    map[x][y]
  end

  def trees_east_sizes
    map[x][0...y]
  end

  def trees_west_sizes
    i = y + 1
    map[x][i..-1]
  end

  def trees_north_sizes
    map.transpose[y][0...x]
  end

  def trees_south_sizes
    j = x + 1
    map.transpose[y][j..-1]
  end
end