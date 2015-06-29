module GameOfLife

  class Cell
    attr_reader :x, :y

    def initialize (x, y)
      @x = x
      @y = y
      @alive = false
    end

    def alive?
      @alive
    end

    def dead?
      !@alive
    end

    def revive!
      @alive = true
    end

    def kill!
      @alive=false
    end

    def push(x,y)
      @x=x
      @y=y
    end

  end
end
