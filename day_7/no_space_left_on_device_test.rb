require 'minitest/autorun'
require_relative 'no_space_left_on_device'

class NoSpaceLeftOnDeviceTest < Minitest::Test
  def test_create_dir_class
    input = File.read('input_test.txt')
    no_space_left_on_device = NoSpaceLeftOnDevice.new(input)
    assert_equal(no_space_left_on_device.device.inspect, "{:name=>\"/\", :size=>48381165, :contents=>[{:name=>\"a\", :size=>94853, :contents=>[{:name=>\"e\", :size=>584, :contents=>[{:name=>\"i\", :size=>584}]}, {:name=>\"f\", :size=>29116}, {:name=>\"g\", :size=>2557}, {:name=>\"h.lst\", :size=>62596}]}, {:name=>\"b.txt\", :size=>14848514}, {:name=>\"c.dat\", :size=>8504156}, {:name=>\"d\", :size=>24933642, :contents=>[{:name=>\"j\", :size=>4060174}, {:name=>\"d.log\", :size=>8033020}, {:name=>\"d.ext\", :size=>5626152}, {:name=>\"k\", :size=>7214296}]}]}")
  end

  def test_return_all_size
    input = File.read('input_test.txt')
    no_space_left_on_device = NoSpaceLeftOnDevice.new(input)
    assert_equal(no_space_left_on_device.part_one, 95437)
  end
end

class NewDirTest <  Minitest::Test
  def test_name
    dir = NewDir.new(name: 'foo')
    assert_equal 'foo', dir.name
  end

  def test_size
    dir = NewDir.new(name: 'foo')
    assert_equal 0, dir.size
  end

  def test_size
    dir = NewDir.new(name: 'foo')
    assert_equal [], dir.contents
  end

  def test_inspect
    dir = NewDir.new(name: 'foo')
    assert_equal("{:name=>\"foo\", :size=>0, :contents=>[]}", dir.inspect)
  end

  def test_add_file
    dir = NewDir.new(name: 'foo')
    file = NewFile.new(name: 'bar', size: 10)
    dir.add(file)
    assert_equal(file, dir.contents.first)
  end

  def test_add_file_into_other_directory
    a = NewDir.new(name: 'a')
    b = NewDir.new(name: 'b')
    file = NewFile.new(name: 'bar', size: 10)

    a.add(b)
    a.add(file, path: ['a', 'b'])
    assert_equal(file, a['b']['bar'])
  end

  def test_add_file_into_other_other_directory
    a = NewDir.new(name: 'a')
    b = NewDir.new(name: 'b')
    c = NewDir.new(name: 'c')
    file = NewFile.new(name: 'bar', size: 10)

    a.add(b)
    a.add(c, path: ['a', 'b'])
    a.add(file, path: ['a', 'b', 'c'])
    assert_equal(file, a['b']['c']['bar'])
  end

  def test_give_the_size
    dir = NewDir.new(name: 'foo')
    file = NewFile.new(name: 'bar', size: 10)
    dir.add(file)
    assert_equal(10, dir.size)
  end

  def test_sum_all_size_file
    dir = NewDir.new(name: 'foobar')
    file_foo = NewFile.new(name: 'foo', size: 10)
    file_bar = NewFile.new(name: 'bar', size: 10)
    dir.add(file_foo)
    dir.add(file_bar)
    assert_equal(20, dir.size)
  end

  def test_add_directory
    dir_foo = NewDir.new(name: 'foo')
    dir_bar = NewDir.new(name: 'bar')
    dir_foo.add(dir_bar)
    assert_equal(dir_bar, dir_foo.contents.first)
  end

  def test_access_to_dir
    dir_foo = NewDir.new(name: 'foo')
    dir_bar = NewDir.new(name: 'bar')
    file_bar = NewFile.new(name: 'bar', size: 10)
    dir_foo.add(dir_bar)
    dir_foo.add(file_bar)
    assert_equal(dir_bar, dir_foo['bar'])
  end

  def test_sum_with_directory
    dir = NewDir.new(name: 'foobar')
    dir_bar = NewDir.new(name: 'bar')
    file_bar = NewFile.new(name: 'bar_file', size: 10)
    dir.add(dir_bar)
    dir_bar.add(file_bar)
    assert_equal(10, dir.size)
  end
end

class NewFileTest < Minitest::Test
  def test_name
    file = NewFile.new(name: 'foo', size: 10)
    assert_equal 'foo', file.name
  end

  def test_size
    file = NewFile.new(name: 'foo', size: 10)
    assert_equal 10, file.size
  end

  def test_inspect
    file = NewFile.new(name: 'foo', size: 10)
    assert_equal("{:name=>\"foo\", :size=>10}", file.inspect)
  end
end
