module GameOfLife
  class Grid
    attr_reader :generations, :cells_visited, :cell_array

    $fp = File.open("output.txt", "w")


    def initialize(height, width, input_generations)
      @height, @width = height,width
      @cell_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new(0,0)}}
      @cell_array.each_index do |i|
        subarray = @cell_array[i]
        subarray.each_index do |j|
          @cell_array[i][j].push(i,j)
        end
      end
      initial_config
      @generations=generator(input_generations)
    end

    def generator(generations)
      temp = 0
      while temp.to_i < generations.to_i do
        next_generation
        temp = temp + 1
      end
      temp
    end

    def initial_config
      [[0,1], [0,2], [0,3]].each do |(x, y)|
        @cell_array[x][y].revive!
      end
      $fp.write "after initial config"
      display
    end

    def makelinear
      @cell_array.flatten
    end

    def next_generation
      temp=0
      @cell_array.each_index do |i|
        subarray = @cell_array[i]
        subarray.each_index do |j|
          temp = temp + 1
          game_rules(i,j)
        end
      end
      $fp.write "Displaying Result of the latest generation!"
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
      if @cell_array[x][y].alive?
        unless alive_neighbors == (2..3)
          @cell_array[x][y].kill!
        end
      else
        if alive_neighbors == 3
          @cell_array[x][y].revive!
        end
      end
    end

    def display
      @cell_array.each_index do |i|
        $fp.write "\n"
        subarray = @cell_array[i]
        subarray.each_index do |j|
          if @cell_array[i][j].alive?
            puts "Aliver"
            $fp.write "A"
          else
            $fp.write " "
          end
        end
      end
    end
  end
end
