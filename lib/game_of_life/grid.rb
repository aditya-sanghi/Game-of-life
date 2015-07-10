module GameOfLife
  class Grid
    attr_reader :generations, :cells_visited, :cell_array, :new_array

    def initialize(height, width, input_generations, file_pointer = File.open("output.txt", "w"))
      @file_pointer = file_pointer
      @height, @width = height,width
      @cell_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new(Cell:: DEAD)}}
      @new_array = Array.new(height) {Array.new(width) {GameOfLife::Cell.new(Cell:: ALIVE)}}
      initial_config
      @generations = generator(input_generations)
    end

    def generator(generations)
      temp = 0
      while temp.to_i < generations.to_i do
        next_generation
        @cell_array = Marshal.load( Marshal.dump(@new_array) )
        temp = temp + 1
      end
      temp
    end

    def initial_config
      [[2,3], [2,4], [2,5]].each do |(x, y)|
        @cell_array[x][y].revive!
      end
      @file_pointer.write "\nAfter initial config"
      @new_array = Marshal.load( Marshal.dump(@cell_array) )
      display
    end

    def make_linear
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
      @file_pointer.write "\nDisplaying Result of the latest generation!"
      display
      @cells_visited = temp.to_i
    end

    def alive_neighbour_count(x,y)
      all_neighbour_coordinates = [[-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1], [-1, -1], [0, -1], [1, -1]]
      all_neighbour_coordinates.inject(0) do |sum, pos|
        sum + (@cell_array[(x + pos[0]) % @height][(y + pos[1]) % @width].alive? ? 1:0)
      end
    end

    def game_rules(x,y)
      alive_neighbour_count = alive_neighbour_count(x,y)
      if @cell_array[x][y].alive?
        unless (alive_neighbour_count == 2 || alive_neighbour_count == 3)
          @new_array[x][y].kill!
        end
      else
        if alive_neighbour_count == 3
          @new_array[x][y].revive!
        end
      end
    end

    def display
      alive = "A"
      dead = "-"
      @new_array.each_index do |i|
        @file_pointer.write "\n"
        subarray = @new_array[i]
        subarray.each_index do |j|
          if @new_array[i][j].alive?
            @file_pointer.write alive
          else
            @file_pointer.write dead
          end
        end
      end
    end
  end
end
