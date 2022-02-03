require_relative 'node'

class LinkedList
    attr_reader :head, :tail

    def initialize
        @head = nil;
        @tail = nil;
    end

    def to_s
        current_node = @head
        until current_node.nil?
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
        print 'nil'
    end

    #########################################################

    def append(value)
        new_node = Node.new(value)
        @head ||= new_node
        
        if @tail
            @tail.next_node = new_node
        end
        @tail = new_node
    end    

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    def size
        count = 0
        current_node = @head
        until current_node.nil?
            count += 1
            current_node = current_node.next_node
        end
        count
    end

    def head
        @head.value
    end

    def tail
        @tail.value
    end

    def at(index)
        current_node = @head
        index.times do
            current_node = current_node.next_node
        end
        current_node.value
    end

    def pop
        current_node = @head
        until current_node.next_node == @tail
            current_node = current_node.next_node
        end
        current_node.next_node = nil
        @tail = current_node
    end

    def contains?(value)
        current_node = @head
        until current_node.next_node.nil?
            if current_node.value == value
                return true
            end
            current_node = current_node.next_node
        end
        return false
    end

    def find(value)
        index = 0
        current_node = @head
        until current_node.next_node.nil?
            if current_node.value == value
                return index
            end
            current_node = current_node.next_node
        end
        return 'nil'
    end
end