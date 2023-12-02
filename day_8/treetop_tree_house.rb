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

  def score_max
    score = 0
    column = column_size - 1
    line = line_size - 1
    for x in (1...column) do
      for y in (1...line) do
        new_score = Tree.score_total(x:, y:, map:)
        score = new_score if new_score > score
      end
    end
    score 
  end

  private

  def line_size
    map.first.size
  end

  def column_size
    map.size
  end
end
