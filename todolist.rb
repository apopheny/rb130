# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    begin
      unless item.class == Todo 
        raise TypeError, "Can only add Todo objects"
      end
    rescue TypeError => e
      puts e.message
    end
      todos << item if item.class == Todo
  end

  def size
    todos.size
  end

  def first
    todos[0].title
  end

  def last
    todos[-1].title
  end

  def to_a
    todos.map { |todo| todo.title} 
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(num)
    begin
      if num >= todos.size
        raise IndexError, "Argument greater than the size of the list"
      end 
      todos[num]
    rescue IndexError => e
      puts e.message
    end
  end

  def mark_done_at(num)
    begin
      if num >= todos.size
        raise IndexError, "Argument greater than the size of the list"
      end 
      todos[num].done!
    rescue IndexError => e
      puts e.message
    end
  end

  def mark_undone_at(num)
    begin
      if num >= todos.size
        raise IndexError, "Argument greater than the size of the list"
      end 
      todos[num].undone!
    rescue IndexError => e
      puts e.message
    end
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def undone!
    todos.each { |todo| todo.undone! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(num)
    begin
      if num >= todos.size
        raise IndexError, "Argument greater than the size of the list"
      end 
    rescue IndexError => e
      puts e.message
    end
      todos.delete_at(num)
  end

  def to_s
    size = todos.map { |todo| todo.title }
    size = size.max.size  / 2
    puts ("-" * size + title + "-" * size)
    todos.map { |todo| puts todo }
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Touch someone's butt")
todo5 = Todo.new("Pet Boo")
todo6 = Todo.new("Study code")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)
list.add(todo5)
list.add(todo6)
list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add
# ---- Interrogating the list -----

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
p list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
p list.shift                      # removes and returns the first item in list

# pop
p list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
p list.remove_at(1)               # removes and returns the 2nd item
list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym