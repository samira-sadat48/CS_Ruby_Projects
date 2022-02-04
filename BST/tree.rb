require_relative 'node'

class Tree
    attr_accessor :data, :root

    def initialize(data)
        @data = data.sort.uniq
        @root = build_tree(@data)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(value, node = root)
        return nil if value == node.data

        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insert(value,node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insert(value,node.right)
        end
    end

    private

    def build_tree(data)
        return nil if data.empty?
        return Node.new(data[0]) if data.length <= 1
        
        mid = (data.length)/ 2
        
        root_node = Node.new(data[mid])
        root_node.left = build_tree(data[0...mid])
        root_node.right = build_tree(data[(mid+1)..-1])

        root_node
    end
end