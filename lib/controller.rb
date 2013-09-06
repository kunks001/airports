class Controller

	def initialize
	end

	def permission(airport)
		airport.weather.sunny?? true : false
	end
end