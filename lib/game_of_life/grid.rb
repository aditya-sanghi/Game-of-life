module GameOfLife
  class Grid
    def initialize(height, width, iterations)
      @height, @width = height,width
      @cell_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new(0,0)}}
      @cell_array.each_index do |i|
        subarray = @cell_array[i]
        subarray.each_index do |j|
          @cell_array[i][j].push(i,j)
        end
      end
      iterator(@height, @width, @iterations)
    end

    def iterator(height, width, iterations)
      temp = 0
      while temp.to_i < iterations.to_i do
        #next_iteration(@height, @width, @iterator)
        temp=temp+1
      end
      temp
    end

    def makelinear
      @cell_array.flatten
    end

    def cell_at(x, y)
      if @cell_array[x]
        @cell_array[x][y]
      end
    end

    def neighbour_checker(x,y)
      [[-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1], [-1, -1], [0, -1], [1, -1] ].inject(0) do |sum, pos|
        sum + (@cell_array[(y + pos[0]) % @height][(x + pos[1]) % @width].alive? ? 1:0)
      end
    end

    def game_rules(x,y)
      if cell_at(x,y).alive?
        unless neighbour_checker(x,y) == (2..3)
          cell_at(x,y).kill!
        end
      else
        if neighbour_checker(x,y) == 3
          cell_at(x,y).revive!
        end
      end
    end

  end
end
