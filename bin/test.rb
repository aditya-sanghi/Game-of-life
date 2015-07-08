require '../lib/game_of_life'

file_pointer = File.open("output.txt", "w")

GameOfLife::Grid.new(9,9,1, file_pointer)

file_pointer.close