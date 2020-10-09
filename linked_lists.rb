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
    link_index = 0
    node = @head
    while node
      return node if link_index == index

      link_index += 1
      node = node.next_node
    end
    puts "Index #{index} not found; index outside range?"
  end

  def pop
    at(size - 2).next_node = nil
    @size -= 1
  end

  def contains?(value)
    node = @head
    while node
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    list_index = 0
    while node
      return list_index if node.value == value

      list_index += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    string = ''
    while node
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value, index)
    node_before_index = at(index - 1)
    insert_node = Node.new(value, node_before_index.next_node)
    node_before_index.next_node = insert_node
  end

  def remove_at(index)
    node_before_index = at(index - 1)
    node_to_remove = node_before_index.next_node
    node_before_index.next_node = node_to_remove.next_node
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
puts list.at(7).value
list.pop
list.pop
puts list
puts list.contains?(15)
puts list.contains?(7)
puts list.find(13)
puts list.find(175)
list.insert_at(11, 4)
puts list
list.remove_at(3)
puts list
