require './lib/controller'

describe Controller do
let(:controller) {Controller.new}
let(:airport) {Airport.new(25)}
let(:weather) {Weather.new}

	it 'should not give permission in stormy weather' do
		airport.weather.set_weather(1)
		controller.permission(airport).should eq false
	end

	it 'should not give permission in stormy weather' do
		airport.weather.set_weather(2)
		controller.permission(airport).should eq true
	end
end