require_relative 'node'

class LinkedList
    attr_reader :head, :tail

    def initialize
        @head = nil;
        @tail = nil;
    end

    def append(value)
        new_node = Node.new(value)
        @head ||= new_node
        
        if @tail
            @tail.next_node = new_node
        end
        @tail = new_node
    end

    #########################################################
    def to_s
        current_node = @head
        until current_node.nil?
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
    end
end