require './lib/plane'

describe Plane do
let(:plane) {Plane.new("a", "b", "c", "d", "e")}
let(:controller_says_yes) {double(permission: true)}
let(:airport) {double(:plane_land => "landed")}
let(:controller) {double}

	it 'should ask permission to take off' do
		plane.asks_permission(controller_says_yes, airport).should eq true
	end

	it 'should have a crew' do
		plane.crew.count.should eq 5
	end

	it 'should be able to land at an airport' do
		plane.land(airport).should eq "landed"
	end

	it 'should be able to take off' do
		allow(airport).to receive(:final_checks).and_return(true)
		plane.take_off(controller, airport).should eq true
	end

end