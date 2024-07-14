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

    it 'vehicle has correct attributes' do
        create_vehicle = @factory.create_vehicles(@wa_ev_registrations)[0]

        expect(create_vehicle.vin).to eq("3C3CFFGE5F")
        expect(create_vehicle.make).to eq("FIAT")
        expect(create_vehicle.model).to eq("500")
        expect(create_vehicle.engine).to eq(:ev)
        expect(create_vehicle.year).to eq("2015")
    end

    it 'iterates through data and creates same ammount of vehicles' do
        create_vehicle = @factory.create_vehicles(@wa_ev_registrations)
        
        expect(@wa_ev_registrations.length).to eq(create_vehicle.length)
    end
end