class Tree
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