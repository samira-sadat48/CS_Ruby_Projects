require_relative 'linked_list'
my_list = LinkedList.new

puts my_list
my_list.append('last')
puts my_list
my_list.prepend('first')
puts my_list
puts my_list.size
puts my_list.head
my_list.append('test1')
my_list.append('test2')
my_list.append('test3')
puts my_list
puts my_list.at(2) #test1
my_list.pop
puts my_list
puts my_list.contains?('test1')
puts my_list.contains?('Samira')
puts my_list.find('test1')
puts my_list.find('Samira')
my_list.insert_at('insert test',2)
puts my_list
my_list.remove_at(2)
puts my_list
