class Binary_student_tree
    include Enumerable

    attr_reader :root

    def initialize
        @root = nil
      end
  
    class Node
      attr_accessor :data, :left, :right
  
      def initialize(data)
        @data = data
        @left = nil
        @right = nil
      end
    end
  

    def add(data)
      @root = add_recursive(@root, data)
    end
  
    def add_recursive(node, data)
        return Node.new(data) if node.nil?
        if data < node.data
          node.left = add_recursive(node.left, data)
        else
          node.right = add_recursive(node.right, data)
        end
        return node
      end

    
    def each(&block)
      DFS(@root, &block)
    end
  
    def DFS(node, &block)
      return if node.nil?
      DFS(node.left, &block)
      yield node.data
      DFS(node.right, &block)
    end
  end
  