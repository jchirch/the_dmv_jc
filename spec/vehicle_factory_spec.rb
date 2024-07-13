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

    # it 'can create vehicles?' do
    #     expect(@factory.create_vehicles(wa_ev_registrations)).to 
    # end

    # it 'converts raw data to' do

    # end


end