require 'cell'

describe Cell do

	it 'initialisation of x,y coordinates' do 

		refcell=Cell.new(1,1)

		expect(refcell.x).to eq(1)
		expect(refcell.y).to eq(1)


	end


	it 'should be dead originally' do

		refcell=Cell.new(1,1)

		expect(refcell.check_alive).to eq(false)

	end

end