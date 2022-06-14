class NoExperienceError < StandardError; end

class Example
  attr_accessor :value, :list

  def initialize
    @value = 'xyz'
    @list = ['xyo']#ExampleList.new
  end

  def hire
    raise NoExperienceError
  end
end

class ExampleList
  def process
    ExampleList.new
  end
end