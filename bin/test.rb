require '../lib/game_of_life'

output_file = File.open("output.txt", "w")

GameOfLife::Grid.new(9,9,10, output_file)

output_file.close