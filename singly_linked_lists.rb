class Node
    attr_accessor :next
    attr_reader   :value
    
    def initialize(value)
        @value = value
        @next  = nil
    end
end

class SinglyLinkedList
    def initialize
        @head = nil
    end

    def append(value)
        if @head
            find_tail.next = Node.new(value)
        else
            @head = Node.new(value)
        end
    end
end