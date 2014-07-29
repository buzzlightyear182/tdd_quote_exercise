class Quote
	
	INCREASE = {'bike' => 0,
				  'motorbike' => 0.2,
				  'car' => 0.3,
				  'van' => 0.4}
	MAX_DISTANCE = {'bike' => 10,
					  'motorbike' => 100,
					  'car' => 200,
					  'van' => 500}

	def initialize(vehicle)
		@vehicle=vehicle
	end

	def from=(from)
		@from=from
	end

	def from
		@from
	end

	def to= (to)
		@to=to
	end

	def to
		@to
	end

	def price
		return 0 if @from == @to
		price = calculate_distance
		price = increase(price)
		price.round(2)
	end

	def calculate_distance
		horizontal_side=from[0]-to[0]
		vertical_side=from[1]-to[1]
		Math.sqrt(horizontal_side**2 + vertical_side**2)
	end

	def increase (price)
		@vehicle = cheaper_transport if greater_max_distance?
		price = price * (1+INCREASE[@vehicle])
	end

	def greater_max_distance?
		calculate_distance > MAX_DISTANCE[@vehicle]
	end

	def cheaper_transport
		distance = calculate_distance
		MAX_DISTANCE.each { |key,value|
			return key if distance < value
		}		
	end

end