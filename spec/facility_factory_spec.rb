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

end