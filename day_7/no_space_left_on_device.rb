class NoSpaceLeftOnDevice
  attr_reader :input, :device

  def initialize(input)
    current_directory = []
    @device = NewDir.new(name: '/')

    input
      .lines(chomp: true)
      .map { |line| line.split(' ') }
      .each do |row|
        if row[1] == 'cd' && row[2] == '..'
          current_directory.pop
        elsif row[1] == 'cd'
          current_directory << row[2]
        elsif row[0] == 'dir'
          device.add(
            NewDir.new(name: row[1]),
            path: current_directory
          )
        elsif row[0] != '$'
          device.add(
            NewFile.new(name: row[1], size: row[0].to_i),
            path: current_directory
          )
        end
      end
  end

  def part_one
    device.find_all_dir
  end

  def part_two
    free = 70000000 - device.size
    size_min = 30000000 - free
    device
      .all_dir_size
      .select { |size| size >= size_min }
      .min
  end
end

class NewDir
  attr_reader :name, :contents

  def initialize(name:)
    @name = name
    @contents = []
  end

  def add(content, path: [])
    if path.size <= 1
      @contents << content
    else
      path = path.drop(1)
      contents
        .find { |c| c.name == path.first }
        .add(content, path: path)
    end
  end

  def find_all_dir
    all_dir = contents
      .select { |content| content.class == NewDir }
      .map(&:find_all_dir)
      .sum

    if all_dir == []
      0
    elsif size <= 100000
      all_dir + size
    else
      all_dir
    end
  end

  def [](key)
    contents
      .find { |content| content.name == key }
  end

  def size
    contents
      .map(&:size)
      .sum
  end

  def all_dir_size
    contents
      .select { |content| content.class == NewDir }
      .map(&:all_dir_size)
      .flatten << size
  end

  def inspect
    {
      name: name,
      size: size,
      contents: contents
    }.to_s
  end
end

class NewFile
  attr_reader :name, :size

  def initialize(name:, size:)
    @size = size
    @name = name
  end

  def inspect
    {
      name: name,
      size: size
    }.to_s
  end
end
