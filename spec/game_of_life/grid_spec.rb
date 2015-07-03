require 'spec_helper'

	module GameOfLife

		describe Grid do
		  it 'initialising a grid' do
				grid=Grid.new(100, 100, 3)
				expect(grid.makelinear.length).to eq(10000)
			end

		it 'returns a cell at the x and y position' do
	    grid = Grid.new(100, 100, 3)
	  	expect(grid.cell_array[0][2]).to eq(grid.makelinear[2])
	    expect(grid.cell_array[1][0]).to eq(grid.makelinear[100])
	  end

		describe '#neighbour_checker(x,y)' do
			it 'should return the correct number of alive neighbors' do
				grid = Grid.new(100, 100, 1)
				(grid.cell_array[0][0]).revive!
				(grid.cell_array[1][2]).revive!
				(grid.cell_array[0][2]).revive!
				expect(grid.neighbour_checker(1,1)).to eq(3)
			end
		end

		describe '#game_rules' do
			it 'should tell the next state of the cell correctly' do
				grid = Grid.new(100, 100, 1)
				(grid.cell_array[0][0]).revive!
				(grid.cell_array[0][1]).revive!
				(grid.cell_array[0][2]).revive!
				grid.game_rules(1,1)
				expect(grid.cell_array[1][1]).to be_alive
     end
		end

		describe '#generator' do
			it 'should stop after given number of generations!' do
				grid = Grid.new(100, 100, 3)
		 		generations=grid.generations
				expect(generations).to eq(3)
		 end
		end

		describe '#next_generation' do
			it 'should go over all the cells in the grid during each generation' do
		    grid = Grid.new(100,100,3)
				cells_visited=grid.cells_visited
				expect(cells_visited).to eq(10000)
		  end
	  end


		describe '#initial_config' do
		  it 'should make the appropriate cells alive initially' do
			  grid = Grid.new(9, 9, 10)
				grid.initial_config
				expect(grid.cell_array[2][3]).to be_alive
				expect(grid.cell_array[2][4]).to be_alive
			end
		end

 end
end
