# frozen_string_literal: true

# Responsible for management of an instance of a linked list
class LinkedList
  attr_reader :head, :tail, :size

  def initialize(head_value = nil, tail_value = nil)
    @head = Node.new(head_value, @tail)
    @tail = Node.new(tail_value, nil)
    @size = 2
  end

  def append(value)
    @tail = Node.new(value)
    @size += 1
  end

  def prepend(value)
    old_head = Node.new(@head.value, @tail)
    new_head = Node.new(value, old_head)
    @head = new_head
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
    while node
      print "( #{node.value} ) -> "
      node = node.next_node
    end
  end
end

# Responsible for creating instances of nodes
class Node
  attr_reader :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new(41, 99)
list.prepend(13)
puts list.size
puts list
