require_relative 'file'

module NoSpaceLeftOnDevice
  class Dir
    attr_reader :name, :ls

    def initialize(name:)
      @name = name
      @ls = []
    end

    def add(dir_or_file)
      ls << dir_or_file
    end

    def size
      ls
        .map(&:size)
        .sum
    end

    def inspect
      {
        name: name,
        size: size,
        ls: ls
      }.to_s
    end
  end
end
