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

      it 'should not be dead after revival' do
        cell = Cell.new(1, 1)
        cell.revive!
        expect(cell).to_not be_dead
      end
    end

    describe '#alive?' do
      it 'should not be alive by default' do
        cell = Cell.new(1, 1)
        expect(cell).not_to be_alive
      end

      it 'should be alive after revival' do
        cell = Cell.new(1, 1)
        cell.revive!
        expect(cell).to be_alive
      end
    end
  end
end
