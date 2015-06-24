require './lib/grid'

describe Grid do

	it 'initialize with the entered size' do

		grid_ref=Grid.new(100, 100)

		expect(grid_ref.make_linear.length).to eq(10000)
		

	end

end