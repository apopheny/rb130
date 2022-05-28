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
  attr_accessor :title

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

  alias_method :<<, :add

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

  def each
    todos.each { |item| yield(item) }
  end

  def select
    results = todos.select { |item| yield(item) }
    new_list = TodoList.new(title)
    results.each { |item| new_list << item }
    new_list
  end

  def find_by_title(string)
    select do |item| 
      if string == item.title
        return item
        break
      end
    end
    nil
  end

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(string)
    find_by_title(string) && find_by_title(string).done!
  end

  def mark_all_done
    each { |item| item.done! }
  end

  def mark_all_undone
    each { |item| item.undone! }
  end

  protected
  attr_accessor :todos
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_done('Buy milk')
# p list.find_by_title('Buy milk')
# list.mark_all_undone
p list.all_done

# p list.all_not_done
