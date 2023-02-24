module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    for item in self
      yield item, i
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |e| result << e if yield e }
    result
  end

  def my_all?
    my_each { |e| return false unless yield e }
    true
  end

  def my_any?
    my_each { |e| return true if yield e }
    false
  end

  def my_none?
    my_each { |e| return false if yield e }
    true
  end

  def my_count
    return length unless block_given?

    i = 0
    my_each { |e| i = i + 1 if yield e }
    i
  end

  def my_map
    return unless block_given?

    result = []
    my_each { |e| result << yield(e) }
    result
  end

  def my_inject(arg)
    my_each { |e| arg = yield(arg, e) }
    arg
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
