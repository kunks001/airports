require './lib/airport'

describe Airport do
let(:airport) {Airport.new(25)}

let(:sunny_weather) { double(:weather, sunny?: true) }
let(:sunny_airport) { Airport.new(25, sunny_weather) }

let(:stormy_weather) { double(:weather, sunny?: false) }
let(:stormy_airport) { Airport.new(25, stormy_weather) }
let(:full_airport) { Airport.new(20) }

let(:alerted_airport) { Airport.new(25, sunny_weather, true) }

let(:airport_runway) { Airport.new(25, sunny_weather, true, [Plane.new("a", "b", "c", "d", "e")]) }

let(:plane) {Plane.new("a", "b", "c", "d", "e")}

let(:controller) {double}

let(:controller) {double}
let(:controller_yes) {double(permission: true)}
let(:controller_no) {double(permission: false)}

### INITIALISATION TESTS
#########################

	it 'should initially contain twenty planes' do
		airport.planes.length.should eq 20
	end

	it 'should initially have an empty runway' do
		airport.runway.length.should eq 0
	end

	it 'should have a max capacity set' do
		airport = Airport.new(50)
		airport.capacity.should eq 50
	end

	it 'should contain a weather object' do
		airport.weather.should_not eq nil
	end

### TAKE_OFF TESTS
#########################

	it 'can send a plane to the runway' do
		airport_runway.runway.count.should eq 1
	end

	it 'should not let a plane take off without going to the runway' do
		airport.final_checks(controller, self)
		airport.planes.length.should eq 20
	end

	it 'should let a plane take off from the runway' do
		airport_runway.plane_takes_off
		airport.runway.length.should eq 0
	end

	it 'should allow a plane to take off if it is sunny' do
		sunny_airport.taxi_to_runway
		sunny_airport.runway.length.should eq 1
	end

	it 'should not allow a plane to take off if it is stormy' do
		stormy_airport.taxi_to_runway
		stormy_airport.runway.length.should eq 0
	end

	it 'should have one less plane when a plane has taken off' do
		airport_runway.plane_takes_off
		airport_runway.runway.length.should eq 1
	end

#### LANDING TESTS
##########################

	it 'should have one more plane once a plane lands' do
		airport.touchdown
		airport.planes.length.should eq 21
	end

	it 'should let a plane land if it is sunny' do
		sunny_airport.plane_land
		sunny_airport.planes.length.should eq 21

	end

	it 'should not let a plane land if it is stormy' do
		stormy_airport.plane_land
		stormy_airport.planes.length.should eq 20
	end

	it 'should know if there is no space for a plane to land' do
		full_airport.space?.should eq false
	end

	it 'should know if there is space for a plane to land' do
		airport.space?.should eq true
	end

	it 'should not let a plane land if full' do
		full_airport.touchdown
		airport.planes.length.should eq 20
	end

	it 'should let a plane land if there is space' do
		airport.touchdown
		airport.planes.length.should eq 21
	end

#### BOMB SCARE TESTS
##########################

	it 'can have a bomb scare' do
		alerted_airport.bomb_scare.should eq true
	end

	it 'can call off a bomb scare' do
		alerted_airport.all_clear
		alerted_airport.bomb_scare.should eq false
	end

	it 'cannot land planes if there is a bomb scare' do
		airport.alert!
		airport.plane_land

		airport.planes.count.should eq 20
	end

	it 'will not let planes taxi to the runway if there is a bomb scare' do
		alerted_airport.taxi_to_runway
		alerted_airport.planes.count.should eq 20
	end

	it 'will not let planes take off if there is a bomb scare' do
		alerted_airport.plane_takes_off
		airport.planes.count.should eq 20
	end
end
