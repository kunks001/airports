require './lib/airport'
require './lib/plane'
require './lib/weather'
require './lib/controller'

describe "Application" do

let(:airport) {Airport.new(25)}
let(:controller) {Controller.new}
let(:weather) {Weather.new}
let(:plane) {Plane.new("a", "b", "c", "d", "e")}

	it 'has to give planes a controllers permission to take off' do
		airport.weather.set_weather(2)
		airport.plane_at_runway
		airport.gets_permission(controller, airport)

		airport.runway.should eq []
	end

	it 'can take off from the airport if conditions are right' do
		airport.weather.set_weather(2)
		airport.taxi_to_runway
		airport.final_checks(controller, airport)

		airport.runway.should eq []
		airport.planes.length.should eq 19
	end

	it 'can land a plane at an airport' do
		airport.weather.set_weather(2)
		plane.land(airport)
		airport.planes.count.should eq 21
	end
end