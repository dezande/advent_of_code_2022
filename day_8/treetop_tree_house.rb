require_relative 'tree'

class TreetopTreeHouse
  attr_reader :map

  def initialize(data)
    @map = data.lines.map { |line| line.scan(/\d/).map(&:to_i) }
  end

  def trees_visible
    resp = 0
    for x in (0...column_size) do
      for y in (0...line_size) do
        resp += 1 if Tree.visible?(x:, y:, map:)
      end
    end
    resp
  end

  private

  def line_size
    map.first.size
  end

  def column_size
    map.size
  end
end
