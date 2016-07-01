require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"


  def test_to_a
    assert_equal(@todos, @list.to_a) 
      # this test passes, since in TodoList class, we defined the #to_a method to simply return @todos instance variable.
      # must reference @list isntead of list, since we did not create attr_accessor
  end

  def test_size # remember to name every test with 'test' prepended
    assert_equal(3, @list.size) 
      # initally expected @todos.size, but being more specific makes test more helpful, so wrote 3
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?) 
      # you could use just assert, or if you use assert_equal, you can expect 'false' for the test to pass
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_add_alias # making sure the << method works as expected
    new_todo = Todo.new("Walk the dog")
    @list << new_todo 
      # here, the << method should be retrieving the @todos array from @list and then adding in the new_todo
    todos = @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    # multiple assertions help make it more specific as to the state of all the @todo objects
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
      # passes this assertion if it verifies that an IndexError is indeed raised by #mark_undone_at
    @list.mark_all_done # will mark all todo objects as done
    @list.mark_undone_at(1)

    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
  end

  def test_done!
    # check that all three todos are true for done?
    @list.done!
    assert_equal(true, @list[0].done?) # checks if @todo1 is done, so uses Todo#done?
    assert_equal(true, @list[1].done?)
    assert_equal(true, @list[2].done?)
    assert_equal(true, @list.done?) # checks if @list is done, so uses TodoList#done?
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    @todo1.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.mark_all_done # you can also use @TodoList#done! for same function

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each {|todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], @list.to_a)
  end

  def test_each_return
    result = []
    new_each = @list.each {|todo| result << todo }
    assert_equal(new_each, @list)
  end

  def test_select
    list = TodoList.new(@list.title)
    @todo1.done!
    list << @todo1
    assert_equal(list.to_s, list.select {|todo| todo.done?}.to_s)
  end

end














