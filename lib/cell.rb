class Cell
	
	attr_reader :x, :y

	def initialize (x,y)
		@x=x
		@y=y
		@alive=false
	end

	def check_alive 
		@alive
	end

	def make_alive
		@alive = true
	end

	def make_dead 
		@alive =false
	end


end