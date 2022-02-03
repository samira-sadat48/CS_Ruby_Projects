require_relative 'linked_list'
my_list = LinkedList.new

puts my_list
my_list.append('last')
puts my_list
my_list.prepend('first')
puts my_list
puts my_list.size