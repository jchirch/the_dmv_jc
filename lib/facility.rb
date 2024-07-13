class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.set_registration_date
      vehicle.set_plate_type
      @collected_fees += vehicle.plate_fees
      @registered_vehicles << vehicle
    end
  end

    def administer_written_test(registrant)
      if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit? == true
        true
      else
        false
      end
    end

    def administer_road_test(registrant)
      if administer_written_test(registrant) == true
        true
      else
        false
      end
    end
  
end
