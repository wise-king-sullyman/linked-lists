# frozen_string_literal: true

# Responsible for management of an instance of a linked list
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @tail = Node.new
    @head = Node.new(nil, @tail)
    @size = 0
  end

  def append(value)
    return if initialize_head_or_tail(@tail, value)

    new_node = @tail
    @tail = Node.new(value)
    new_node.next_node = @tail
    @size += 1
  end

  def prepend(value)
    return if initialize_head_or_tail(@head, value)
    
    new_head = Node.new(value, @head)
    @head = new_head
    @size += 1
  end

  def initialize_head_or_tail(variable_name, value)
    return if variable_name.value

    variable_name.value = value
    @size += 1
    true
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

list = LinkedList.new
list.prepend(13)
list.prepend(10)
list.prepend(7)
list.append(150)
list.append(200)
list.prepend(5)
list.append(300)
list.prepend(1)
puts "Tail: #{list.tail.value}, Head: #{list.head.value}"
puts list.size
puts list
