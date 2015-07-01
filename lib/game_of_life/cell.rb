module GameOfLife

  class Cell

    def initialize 
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

  end
end
