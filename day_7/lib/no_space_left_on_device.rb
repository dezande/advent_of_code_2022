class NoSpaceLeftOnDevice
  attr_reader :input, :device

  def initialize(input)
    @input = input
    @device = []
  end
end