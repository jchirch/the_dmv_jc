require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    before(:each) do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations 
        # .length = 5
        @factory = FacilityFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'facility has correct attributes' do
        create_a_facility = @factory.create_facility(@co_dmv_office_locations)[1]

        expect(create_a_facility.phone).to eq("(720) 865-4600")
    end

    
    # it 'converts data to vehicle class object with method' do
    #     expect(@factory.create_facility(@co_dmv_office_locations)).to be_an_instance_of(FacilityFactory) 
    # end
# require 'pry'; binding.pry
end