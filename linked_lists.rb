# frozen_string_literal: true

# Responsible for management of an instance of a linked list
class LinkedList
  def append(value)
  end

  def prepend(value)
  end

  def size
  end

  def head
  end

  def tail
  end

  def at(index)
  end

  def pop
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
  end
end

# Responsible for creating instances of nodes
class Node
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def next_node
    @next_node
  end
end
