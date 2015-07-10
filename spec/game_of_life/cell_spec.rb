#require 'spec_helper'
require_relative '../../lib/game_of_life/cell'

module GameOfLife
  describe Cell do

    describe '#a cell that is dead' do

      it 'should not be dead after revival' do
        cell = Cell.new(Cell:: DEAD)
        cell.revive!
        expect(cell).to_not be_dead
      end

      it 'should be alive after revival' do
        cell = Cell.new(Cell:: DEAD)
        cell.revive!
        expect(cell).to be_alive
      end

      it 'should not be alive if no operation performed on it' do
        cell = Cell.new(Cell:: DEAD)
        expect(cell).not_to be_alive
      end

      it 'should be dead if no operation performed on it' do
        cell = Cell.new(Cell:: DEAD)
        expect(cell).to be_dead
      end
    end

    describe 'a cell that is alive' do
      it 'should be alive if no operation performed on it' do
        cell = Cell.new(Cell:: ALIVE)
        expect(cell). to be_alive
      end

      it 'should be alive after revival' do
        cell = Cell.new(Cell:: ALIVE)
        cell.revive!
        expect(cell).to be_alive
      end

      it 'should be dead after being killed' do
        cell = Cell.new(Cell:: ALIVE)
        cell.kill!
        expect(cell).to be_dead
      end

      it 'should not be dead if no operation performed on it' do
        cell = Cell.new(Cell:: ALIVE)
        expect(cell).to_not be_dead
      end
    end
  end
end