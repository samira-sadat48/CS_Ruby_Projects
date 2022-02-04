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

    def insert(value, node = @root)
        return nil if value == node.data

        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insert(value,node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insert(value,node.right)
        end
    end

    def find(value, current = @root)
        return current if current.data == value

        current.data > value ? find(value, current.left) : find(value, current.right)
    end

    def delete(value, node = @root)
        return node if node.nil?
        
        parent_node = parent(value)
        left_node = find(value).left
        right_node = find(value).right

        #if the node to be deleted has no children
        if left_node.nil? && right_node.nil?
            delete_end_node(parent_node,value)
        elsif left_node.nil? || right_node.nil?
            delete_single_child_node(parent_node,value)
        else
            delete_double_child_node(parent_node,value)
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

    def parent(value, current = @root)
        return nil if @root == value
        return current if current.left.data == value || current.right.data == value

        current.data > value ? parent(value, current.left) : parent(value, current.right)
    end

    def delete_end_node(parent,value)
        parent.data > value ? parent.left = nil : parent.right = nil
    end

    def delete_single_child_node(parent,value)
        grandchild = find(value).right if find(value).left.nil?
        grandchild = find(value).left if find(value).right.nil?

        parent.right = grandchild if parent.right == find(value)
        parent.left = grandchild if parent.left == find(value)
    end

    def delete_double_child_node(parent,value)
        replace = find_inorder_successor(value)
        delete(replace.data)
        replace.right = find(value).right
        replace.left = find(value).left
        parent.right = replace if parent.right == find(value)
        parent.left = replace  if parent.left == find(value)
    end

    def find_inorder_successor(value, successor = value)
        result = find(successor + 1)
        return result unless result.nil?
    
        find_inorder_successor(successor + 1)
    end

end