module GameOfLife
  class Grid
    attr_reader :iterations, :cells_visited
    def initialize(height, width, input_iterations)
      @height, @width = height,width
      @cell_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new(0,0)}}
      @cell_array.each_index do |i|
        subarray = @cell_array[i]
        subarray.each_index do |j|
          @cell_array[i][j].push(i,j)
        end
      end
      initial_config
      @iterations=iterator(input_iterations)
    end

    def iterator(iterations)
      temp = 0
      while temp.to_i < iterations.to_i do
        next_iteration
        temp = temp + 1
      end
      temp
    end

    def initial_config
      [[0,0], [0,1], [0,2]].each do |(x, y)|
        @cell_array[x][y].revive!
      end
    end

    def makelinear
      @cell_array.flatten
    end

    def cell_at(x, y)
      if @cell_array[x]
        @cell_array[x][y]
      end
    end

    def next_iteration
      temp=0
      @cell_array.each_index do |i|
        subarray = @cell_array[i]
        subarray.each_index do |j|
          temp = temp + 1
          game_rules(i,j)
        end
      end
      display
      @cells_visited = temp.to_i
    end

    def neighbour_checker(x,y)
      [[-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1], [-1, -1], [0, -1], [1, -1] ].inject(0) do |sum, pos|
        sum + (@cell_array[(y + pos[0]) % @height][(x + pos[1]) % @width].alive? ? 1:0)
      end
    end

    def game_rules(x,y)
      alive_neighbors=neighbour_checker(x,y)
      if cell_at(x,y).alive?
        unless alive_neighbors == (2..3)
          cell_at(x,y).kill!
        end
      else
        if alive_neighbors == 3
          cell_at(x,y).revive!
        end
      end
    end

    def display
      @cell_array.each_index do |i|
        puts "\n"
        subarray = @cell_array[i]
        subarray.each_index do |j|
          if cell_at(i,j).alive?
            print 'A'
          else
            
          end
        end
      end
    end

    puts Grid.new(100,100,13)

  end
end
