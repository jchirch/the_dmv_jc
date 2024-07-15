require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    describe '#create_co_facility' do
    before(:each) do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations 
        @factory = FacilityFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'facility has correct attributes' do
        create_a_facility = @factory.create_co_facility(@co_dmv_office_locations)[1]

        expect(create_a_facility.phone).to eq("(720) 865-4600")
        expect(create_a_facility.name).to eq("DMV Northeast Branch")
        expect(create_a_facility.address).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
    end

    it 'converts all input data to same ammount of facility objects' do
        expect(@co_dmv_office_locations.length).to eq(@factory.create_co_facility(@co_dmv_office_locations).length)
    end
    end
    
    describe '#create_ny_facility' do
    before(:each) do
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        @factory = FacilityFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'facility has correct attributes' do
        create_a_facility = @factory.create_ny_facility(@ny_dmv_office_locations)[0]
        # facilities = @factory.create_ny_facility(@ny_dmv_office_locations)
        expect(create_a_facility.name).to eq("HUNTINGTON")
        expect(create_a_facility.phone).to eq("7184774820")
        expect(create_a_facility.address).to eq("1815 E JERICHO TURNPIKE HUNTINGTON NY 11743")
    end

    it 'converts all input data to same ammount of facility objects' do
        expect(@ny_dmv_office_locations.length).to eq(@factory.create_co_facility(@ny_dmv_office_locations).length)
    end
    end

    describe '#create_mo_facility' do
    before(:each) do
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
        @factory = FacilityFactory.new
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(FacilityFactory)
    end

    it 'facility has correct attributes' do
        create_a_facility = @factory.create_mo_facility(@mo_dmv_office_locations)[0]

        expect(create_a_facility.name).to eq("FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE")
        expect(create_a_facility.phone).to eq("(314) 733-5316")
    end
    end
end