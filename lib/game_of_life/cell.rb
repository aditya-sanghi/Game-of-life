
module GameOfLife
	class Cell
		attr_reader :x, :y

		def initialize (x, y)
			@x = x
			@y = y
			@alive = false
		end

		def alive?; end
	end
end
