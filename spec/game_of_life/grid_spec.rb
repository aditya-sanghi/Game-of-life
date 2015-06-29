require 'spec_helper'

	module GameOfLife

		describe Grid do
			it 'initialising the array used as a grid' do
				grid=Grid.new(100, 100, 3)
				expect(grid.makelinear.length).to eq(10000)
			end

		it 'returns a cell at the x and y position' do
	    grid = Grid.new(3, 3, 3)
	  	expect(grid.cell_at(0, 2)).to eq(grid.makelinear[2])
	    expect(grid.cell_at(1, 0)).to eq(grid.makelinear[3])
	  end

		describe '#neighbour_checker(x,y)' do
			it 'should return the correct number of alive neighbors' do
				grid = Grid.new(3, 3, 1)
				grid.cell_at(0,0).revive!
				grid.cell_at(1,2).revive!
				expect(grid.neighbour_checker(1,1)).to eq(2)
			end
		end

		describe

		describe '#game_rules' do
			it 'should tell the next state of the cell correctly' do
				grid = Grid.new(3, 3, 1)
				grid.cell_at(0,0).revive!
				grid.cell_at(1,2).revive!
				grid.cell_at(0,1).revive!
				grid.game_rules(1,1)
				expect(grid.cell_at(1,1)).to be_alive
     end
		end

		describe '#iterator' do
			it 'should stop after given number of iterations!' do
				grid = Grid.new(3, 3, 3)
		 		iterations=grid.iterations
				expect(iterations).to eq(3)
		 end
		end

		describe '#next_iteration' do
			it 'should go over all the cells in the grid during each iteration' do
		    grid=Grid.new(3,3,3)
				cells_visited=grid.cells_visited
				expect(cells_visited).to eq(9)
		  end
	  end

 end
end
