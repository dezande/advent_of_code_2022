module NoSpaceLeftOnDevice
  class File
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
end
