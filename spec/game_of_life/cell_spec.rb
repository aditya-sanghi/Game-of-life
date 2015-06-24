require_relative '../spec_helper'

module GameOfLife
	describe Cell do
		it '#initialization' do
			cell = Cell.new(1, 1)
			expect(cell.x).to eq(1)
			expect(cell.y).to eq(1)
		end

		describe '#dead?' do
			it 'should be dead by default' do
				cell = Cell.new(1, 1)
				expect(cell).to be_dead
			end

			it 'should not be dead when revived' do
				cell = Cell.new(1, 1)
				cell.revive!
				expect(cell).to_not be_dead
			end
		end
	end
end
