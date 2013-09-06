require './lib/weather'

describe Weather do
let(:weather) {Weather.new}

	it 'should have two states: sunny and stormy' do
		array = Array.new
		array << weather.stormy? 
		array << weather.sunny?
		array.length == 2
	end

	it 'should assign weather' do
		weather.set_weather

		weather.stormy?.should_not eq nil
		weather.sunny?.should_not eq nil
	end

	it 'should know that when the weather is sunny, it is not stormy' do
		weather.set_weather(1)

		weather.stormy?.should eq true
		weather.sunny?.should eq false
	end

	it ' should know that when the weather is sunny, it is not stormy' do
		weather.set_weather(2)

		weather.stormy?.should eq false
		weather.sunny?.should eq true
	end

	it 'should have a 1 in 2 chance of being stormy' do
		weather.instance_variable_set(:@stormy, nil)
		weather.set_weather(3)

		weather.stormy?.should eq nil
	end

	it 'should have a 1 in 2 chance of being sunny' do
		weather.instance_variable_set(:@sunny, nil)
		weather.set_weather(3)

		weather.sunny?.should eq nil
	end

	it 'should know when it is sunny' do
		weather.set_weather(2)
		weather.sunny?.should eq true
	end

	it 'should know when it is stormy' do
		weather.set_weather(1)
		weather.stormy?.should eq true
	end
end