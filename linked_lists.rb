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
    list_index = 0
    node_iterator do |node|
      return node if list_index == index

      list_index += 1
    end
    puts "Index #{index} not found; index outside range?"
  end

  def pop
    second_to_last_node = at(size - 2)
    second_to_last_node.next_node = nil
    @tail = second_to_last_node
    @size -= 1
  end

  def contains?(value)
    node_iterator { |node| return true if node.value == value }
    false
  end

  def find(value)
    list_index = 0
    node_iterator do |node|
      return list_index if node.value == value

      list_index += 1
    end
    nil
  end

  def to_s
    string = ''
    node_iterator { |node| string += "( #{node.value} ) -> " }
    string += 'nil'
    string
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
    else
      node_before_index = at(index - 1)
      insert_node = Node.new(value, node_before_index.next_node)
      node_before_index.next_node = insert_node
      @size += 1
    end
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node 
    else
      node_before_index = at(index - 1)
      node_to_remove = node_before_index.next_node
      node_before_index.next_node = node_to_remove.next_node
    end
    @size -= 1
  end

  def node_iterator
    node = @head
    while node
      yield node
      node = node.next_node
    end
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
