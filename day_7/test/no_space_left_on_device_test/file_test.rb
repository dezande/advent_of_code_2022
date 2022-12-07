require 'minitest/autorun'
require_relative '../../lib/no_space_left_on_device/file'

module NoSpaceLeftOnDeviceTest
  class FileTest < Minitest::Test
    def test_name
      file = NoSpaceLeftOnDevice::File.new(name: 'foo', size: 10)
      assert_equal 'foo', file.name
    end

    def test_size
      file = NoSpaceLeftOnDevice::File.new(name: 'foo', size: 10)
      assert_equal 10, file.size
    end

    def test_inspect
      file = NoSpaceLeftOnDevice::File.new(name: 'foo', size: 10)
      assert_equal("{:name=>\"foo\", :size=>10}", file.inspect)
    end
  end
end
