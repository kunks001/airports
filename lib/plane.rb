class Plane

	def initialize(captain, copilot, steward1, steward2, steward3)
		@crew = [captain, copilot, steward1, steward2, steward3]
	end

	def crew
		@crew
	end

	def asks_permission(controller, airport)
		controller.permission(airport)
	end

	def land(airport)
		airport.plane_land
	end

	def take_off(controller, airport)
		airport.final_checks(controller, airport)
	end
end