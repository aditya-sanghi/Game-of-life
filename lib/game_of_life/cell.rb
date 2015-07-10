module GameOfLife

  class Cell
    DEAD = "dead"
    ALIVE = "alive"
    
    def initialize(status)
      @status = status
    end

    def alive?
      @status == ALIVE
    end

    def dead?
      @status == DEAD
    end

    def revive!
      @status = ALIVE
    end

    def kill!
      @status = DEAD
    end

  end
end