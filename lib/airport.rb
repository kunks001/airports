class Airport

#### INITIALISATION METHODS
#########################

	def initialize(capacity, weather = Weather.new, bomb_scare = false, runway = [])
		@planes = []
		initial_number_of_planes
		@weather = weather
		@capacity = capacity
		@bomb_scare = bomb_scare
		@runway = runway
		@controller = Controller.new
	end

	def initial_number_of_planes
		x=0
		while x < 20
			@planes << Plane.new("a", "b", "c", "d", "e")
			x +=1
		end
	end

	def airport
		self
	end

	def planes
		@planes
	end

	def weather
		@weather
	end

	def runway
		@runway
	end

	def controller
		@controller
	end

	def capacity
		@capacity
	end

#### TAKE OFF METHODS
#########################

	def taxi_to_runway
		if weather.sunny? && !bomb_scare
			plane_at_runway
		end
	end

	def plane_at_runway
		@runway << planes.shift
	end

	def final_checks(controller, airport)
		unless runway == []
			gets_permission(controller, airport)
		end	
	end

	def gets_permission(controller, airport)
		plane = runway.first
		unless plane.asks_permission(controller, airport) == false
			plane_takes_off
		end
	end

	def plane_takes_off
		if !bomb_scare
			runway.shift
		end
	end

#### LANDING METHODS
#########################

	def space?
		if planes.count + runway.count < capacity
			true
		else
			false
		end
	end

	def plane_land
		if weather.sunny? && space? && !bomb_scare
			touchdown
		end
	end

	def touchdown
		planes << Plane.new("a", "b", "c", "d", "e") unless planes.length >= 25
	end

#### BOMB SCARE METHODS
#########################

	def bomb_scare
		@bomb_scare
	end

	def alert!
		@bomb_scare = true
	end

	def all_clear
		@bomb_scare = false
	end
end