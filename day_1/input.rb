class Input
  def self.read
    File
      .read('input.txt')
      .split("\n")
  end
end
