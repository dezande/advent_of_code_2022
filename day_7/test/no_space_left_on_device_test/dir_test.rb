require 'minitest/autorun'
require_relative '../../lib/no_space_left_on_device/dir'
require_relative '../../lib/no_space_left_on_device/file'

module NoSpaceLeftOnDeviceTest
  class DirTest <  Minitest::Test
    def test_name
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      assert_equal 'foo', dir.name
    end

    def test_size
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      assert_equal 0, dir.size
    end

    def test_size
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      assert_equal [], dir.ls
    end

    def test_inspect
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      assert_equal("{:name=>\"foo\", :size=>0, :ls=>[]}", dir.inspect)
    end

    def test_add_file
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      file = NoSpaceLeftOnDevice::File.new(name: 'bar', size: 10)
      dir.add(file)
      assert_equal(file, dir.ls.first)
    end

    def test_give_the_size
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      file = NoSpaceLeftOnDevice::File.new(name: 'bar', size: 10)
      dir.add(file)
      assert_equal(10, dir.size)
    end

    def test_sum_all_size_file
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foobar')
      file_foo = NoSpaceLeftOnDevice::File.new(name: 'foo', size: 10)
      file_bar = NoSpaceLeftOnDevice::File.new(name: 'bar', size: 10)
      dir.add(file_foo)
      dir.add(file_bar)
      assert_equal(20, dir.size)
    end

    def test_add_directory
      dir_foo = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      dir_bar = NoSpaceLeftOnDevice::Dir.new(name: 'bar')
      dir_foo.add(dir_bar)
      assert_equal(dir_bar, dir_foo.ls.first)
    end

    def test_access_to_dir
      dir_foo = NoSpaceLeftOnDevice::Dir.new(name: 'foo')
      dir_bar = NoSpaceLeftOnDevice::Dir.new(name: 'bar')
      file_bar = NoSpaceLeftOnDevice::File.new(name: 'bar', size: 10)
      dir_foo.add(dir_bar)
      dir_foo.add(file_bar)
      assert_equal(dir_bar, dir_foo['bar'])
    end

    def test_sum_with_directory
      dir = NoSpaceLeftOnDevice::Dir.new(name: 'foobar')
      dir_bar = NoSpaceLeftOnDevice::Dir.new(name: 'bar')
      file_bar = NoSpaceLeftOnDevice::File.new(name: 'bar', size: 10)
      dir.add(dir_bar)
      dir_bar.add(file_bar)
      assert_equal(10, dir.size)
    end
  end
end
