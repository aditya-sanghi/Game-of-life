require 'spec_helper'

	module GameOfLife

		describe Grid do
			it 'initialising the array used as a grid' do
				grid=Grid.new(100, 100)
				expect(grid.makelinear.length).to eq(10000)
			end


		it 'should contain x coordinates 0 to 99' do
			grid=Grid.new(100, 100)
			expect(grid.makelinear).to include(0..99)
  	end

		it 'should have all cells as dead' do
			grid=Grid.new(100, 100)
			expect(grid.makelinear.all?(&:dead?)).to eq (true)
		end

		it 'returns a cell at a x and y position' do
	    grid = Grid.new(3, 3)
	  	expect(grid.cell_at(0, 2)).to eq(grid.makelinear[2])
	    expect(grid.cell_at(1, 0)).to eq(grid.makelinear[3])
	  end

		describe '#neighbour_checker(x,y)' do
			it 'should return the appropriate number of alive neighbors' do
				grid=Grid.new(3,3)
				grid.cell_at(0,0).revive!
				grid.cell_at(1,2).revive!
				expect(grid.neighbour_checker(1,1)).to eq(2)
			end
		end
 end
end
