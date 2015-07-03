module GameOfLife
  class Grid
    attr_reader :generations, :cells_visited, :cell_array

    $fp = File.open("output.txt", "w")


    def initialize(height, width, input_generations)
      @height, @width = height,width
      @cell_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new}}
      @new_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new}}
      initial_config
      @new_array = @cell_array.clone
      @generations = generator(input_generations)
    end

    def generator(generations)
      temp = 0
      while temp.to_i < generations.to_i do
        next_generation
        @cell_array = @new_array.clone
        temp = temp + 1
      end
      temp
    end

    def initial_config
      [[2,3], [2,4], [2,5]].each do |(x, y)|
        @cell_array[x][y].revive!
      end
      $fp.write "after initial config"
      @new_array = @cell_array.clone
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
        sum + (@cell_array[(x + pos[0]) % @height][(y + pos[1]) % @width].alive? ? 1:0)
      end
    end

    def game_rules(x,y)
      alive_neighbors=neighbour_checker(x,y)
      if @cell_array[x][y].alive?
        unless alive_neighbors == (2..3)
          @new_array[x][y].kill!
        end
      else
        if alive_neighbors == 3
          @new_array[x][y].revive!
        end
      end
    end

    def display
      puts "IN display"
      @new_array.each_index do |i|
        $fp.write "\n"
        subarray = @new_array[i]
        subarray.each_index do |j|
          if @new_array[i][j].alive?
            puts "Aliver"
            $fp.write "A"
          else
            $fp.write "-"
          end
        end
      end
    end
  end
end
