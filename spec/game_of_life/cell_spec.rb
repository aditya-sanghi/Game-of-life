require 'spec_helper'

module GameOfLife
  describe Cell do

    describe '#initialization' do
      it 'should be dead by default' do
        cell = Cell.new
        expect(cell).to be_dead
      end
    end

    describe '#revive!' do
      it 'should not be dead after revival' do
          cell = Cell.new
          cell.revive!
          expect(cell).to_not be_dead
      end

      it 'should be alive after revival' do
        cell = Cell.new
        cell.revive!
        expect(cell).to be_alive
      end
    end

    describe '#alive?' do
      it 'should not be alive by default' do
        cell = Cell.new
        expect(cell).not_to be_alive
      end
    end

    describe '#kill!' do
      it 'should make the cell dead' do
        cell = Cell.new
        cell.revive!
        cell.kill!
        expect(cell). to be_dead
      end
    end

  end
end
