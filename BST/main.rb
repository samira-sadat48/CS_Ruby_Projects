require_relative 'tree'

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(data)

#puts tree.data
tree.pretty_print
tree.insert(10)
tree.pretty_print
tree.delete(4)
tree.pretty_print