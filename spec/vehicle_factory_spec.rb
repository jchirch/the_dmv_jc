require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    before(:each) do
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory = VehicleFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
    end

    it 'converts data to vehicle class object with method' do
        expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle) 
    end

    it 'iterates through data and creates same ammount of vehicles' do
        create_vehicle = @factory.create_vehicles(@wa_ev_registrations)
        
        expect(@wa_ev_registrations.length).to eq(create_vehicle.length)
    end

    it 'created objects are expected data type' do
        create_vehicle = @factory.create_vehicles(@wa_ev_registrations)[0]
        
        expect(create_vehicle.vin).to be_a(String)
        expect(create_vehicle.make).to be_a(String)
        expect(create_vehicle.model).to be_a(String)
        expect(create_vehicle.engine).to be_a(Symbol)
        expect(create_vehicle.year).to be_a(String)
    end

    it 'creates objects with populated values' do
        create_vehicle = @factory.create_vehicles(@wa_ev_registrations)[0]

        expect(create_vehicle.vin).not_to be_empty
        expect(create_vehicle.make).not_to be_empty
        expect(create_vehicle.model).not_to be_empty
        expect(create_vehicle.engine).not_to be_empty
        expect(create_vehicle.year).not_to be_empty
    end
end