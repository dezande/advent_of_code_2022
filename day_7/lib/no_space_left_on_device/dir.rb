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

    def [](key)
      ls
        .find { |dir_or_file| dir_or_file.name == key && dir_or_file.class == Dir }
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
