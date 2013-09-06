class Weather

	def initialize
		@stormy = nil
		@sunny = nil
		set_weather()
	end

	def stormy?
		@stormy
	end

	def sunny?
		@sunny
	end

	def set_weather(probability = nil)
		probability ||= rand (1..2)
		if probability == 1
				stormy_weather
			elsif probability == 2
				sunny_weather
			else
		end
	end

	def stormy_weather
		@stormy = true
		@sunny = false
	end

	def sunny_weather
		@stormy = false
		@sunny = true
	end
end