require_relative '../spec_helper'

module GameOfLife
	describe Cell do
		it '#initialization' do
			cell = Cell.new(1, 1)
			expect(cell.x).to eq(1)
			expect(cell.y).to eq(1)
		end

		describe '#alive?' do
			it 'should be dead by default' do
				cell = Cell.new(1, 1)
				expect(cell).to_not be_alive
			end
		end
	end
end
