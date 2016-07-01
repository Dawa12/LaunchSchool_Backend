require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end



# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? {|todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end

  def [](arg) # making this method accessible to the @todos array specifically
    @todos[arg]
  end

  alias_method :add, :<< # simply renames << to 'add', so u can call << functionality with 'add'

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo| 
      #taking a shortcut and borrowing the Array#each instead of creating our own with a counter
      yield(todo)
    end
    self # will return original caller object, which is TodoList class  
  end


  def select
    list = TodoList.new(title)
      # will keep title the same of this new list, we're calling the title getter method
    each do |todo|
      list.add(todo) if yield(todo)
    end
    
    list
  end

  # all_done  returns new TodoList object containing only the done items
  # all_not_done  returns new TodoList object containing only the not done items
  # mark_done takes a string as argument, and marks the first Todo object that matches the argument as done.
  # mark_all_done mark every todo as done
  # mark_all_undone mark every todo as not done

  def mark_done(string)
    find_by_title(string).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def find_by_title(string)
    @todos.each do |str|
      return str if str.title == string
    end
    nil
  end

  def find_by_title(string)
    select { |str| str.title == string }.first
  end

  def all_done
    select { |todo| todo.done? } # is it better practice to do @todos.select to be more explicit?
  end

  def all_not_done
    select { |todo| !todo.done? }
  end


end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to the gym")

# instantiated three Todo class objects

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
 

# p list
# p list.to_a

# created instance of TodoList class and added Todo objects to its collection 
# p list.each { |todo| puts todo }
# p list.find_by_title('Clean room')
# p list.mark_done("Clean room")
# p todo2
# p todo2
# p list.mark_all_done
# p todo1
# p list.mark_all_undone
# results = list.select { |todo| todo.done? }    # you need to implement this method
# puts results.inspect











 
