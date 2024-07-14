require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    before(:each) do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations 
        @factory = FacilityFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'facility has correct attributes' do
        create_a_facility = @factory.create_facility(@co_dmv_office_locations)[1]

        expect(create_a_facility.phone).to eq("(720) 865-4600")
        expect(create_a_facility.name).to eq("DMV Northeast Branch")
        expect(create_a_facility.address).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
    end

    it 'converts all input data to same ammount of facility objects' do
        expect(@co_dmv_office_locations.length).to eq(@factory.create_facility(@co_dmv_office_locations).length)
    end
end