# frozen_string_literal: true

# Responsible for management of an instance of a linked list
class LinkedList
  attr_reader :head, :tail, :size

  def initialize(head_value = nil, tail_value = nil)
    @tail = Node.new(tail_value, nil)
    @head = Node.new(head_value, @tail)
    @size = 2
  end

  def append(value)
    @tail = Node.new(value)
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value, @head.next_node)
    @head.next_node = new_node
    @size += 1
  end

  def at(index)

  end

  def pop
    @size -= 1
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
    node = @head
    string = ""
    while node
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += 'nil'
    string
  end
end

# Responsible for creating instances of nodes
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new('head', 'tail')
list.prepend(13)
list.prepend(10)
list.prepend(7)
puts list.size
puts list
