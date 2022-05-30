class Todo
  DONE_MARKER = '[X]'
  UNDONE_MARKER = '[ ]'

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
    "#{done? ? DONE_MARKER : UNDONE_MARKER} #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.class == Todo
    @todos << todo
  end

  alias << add

  def display
    @todos
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    @todos.select { |item| item }
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(num)
    @todos.fetch(num)
  end

  def mark_done_at(num)
    item_at(num).done!
  end

  def mark_undone_at(num)
    item_at(num).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(num)
    @todos.delete(item_at(num))
  end

  def to_s
    size = @todos.map { |todo| todo.title.size }.max
    size = title.size >= size ? 2 : (size- title.size) / 2 + 2
    text = "#{"-" * size} #{title} #{"-" * size}\n"
    text << @todos.map(&:to_s).join("\n")
  end

  def each
    counter = 0
    until counter == @todos.size
      yield(@todos[counter])
      counter += 1
    end
    self
  end

  def select
    counter = 0
    result = TodoList.new(title)
    until counter == @todos.size
      result << @todos[counter] if yield(@todos[counter])
      counter += 1
    end
    result
  end

  def find_by_title(string)
    select { |item| string == item.title }.first
  end

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(string)
    each do |item|
      if item.title == string
        item.done! 
        break
      end  
    end
  end

  def mark_all_done
    each { |item| item.done! }
  end

  def mark_all_undone
    each { |item| item.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Study a lot of code that I understand sometimes")
todo5 = Todo.new("Sleep")

list = TodoList.new("Today's Todos")

list << todo1
list << todo2
list << todo3
list << todo4
list << todo5

p list.find_by_title('Sleep')