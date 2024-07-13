require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)

  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicles' do
    it 'can access list of registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'can register a vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_1.registered_vehicles[0]).to be_an_instance_of(Vehicle)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'cannot register unless facility has the service' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'can set a registration date' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '#payment' do
    it 'can access collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can collect fees' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)      
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#written test' do
    it 'cannot administer written test unless facility has the service' do
      expect(@facility_1.services).to eq([])
      expect(@facility_1.administer_written_test(@registrant_1)).to be false
    end

    it 'cannot administer written test unless registrant is over 16 and has permit' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@facility_1.administer_written_test(@registrant_2)).to be false
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
    end

    it 'updates license data with method' do
      @facility_1.add_service('Written Test')
      expect(@registrant_1.license_data[:written]).to be false
      @registrant_1.pass_written
      expect(@registrant_1.license_data[:written]).to be true
    end

    it 'updates license data when passes administered written test' do
      @facility_1.add_service('Written Test')
      expect(@registrant_1.license_data[:written]).to be false
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to be true
    end
  end

  describe '#road test' do
    it 'cannot administer road test unless registrant passed written test' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_1)).to be true
      expect(@facility_1.administer_road_test(@registrant_2)).to be false
      expect(@facility_1.administer_road_test(@registrant_3)).to be false
    end

    it 'updates license data with method' do
      expect(@registrant_1.license_data[:license]).to be false
      @registrant_1.pass_road
      expect(@registrant_1.license_data[:license]).to be true
    end

    it 'updates license data when pass road test' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      expect(@registrant_1.license_data[:license]).to be false
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to be true
    end
    
    #--Is this test necessary?---------------------------
    # xit 'earns license if qualifies for road test' do
    #   # require 'pry'; binding.pry
    #   @facility_1.add_service('Written Test')
    #   @facility_1.add_service('Road Test')
    #   @facility_1.administer_road_test(@registrant_1)
    #   @facility1.administer_written_test(@registrant_1)
    #   expect(@registrant_1.license?).to be true  
    # end
  end

  describe '#renew drivers license' do
    it 'can only renew license if passed road test and earned license' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(@registrant_1)).to be false
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
    end

    it 'updates license renewed data with method' do
      expect(@registrant_1.license_data[:renewed]).to be false
      @registrant_1.renew_license
      expect(@registrant_1.license_data[:renewed]).to be true
    end

    it 'will renew license if registrant had passed road test and has license' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@registrant_1.license_data[:renewed]).to be false
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data[:renewed]).to be true
    end

    it 'will not renew license if registrant does not meet criteria' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@registrant_3.license_data[:renewed]).to be false
      @facility_1.administer_written_test(@registrant_3)
      @facility_1.administer_road_test(@registrant_3)
      @facility_1.renew_drivers_license(@registrant_3)
      expect(@registrant_3.license_data[:renewed]).to be false
    end

  end

end
