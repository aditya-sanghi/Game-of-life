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
	end
end
