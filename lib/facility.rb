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
        registrant.pass_written
        true
      else
        false
      end
    end

    def administer_road_test(registrant)
      if @services.include?('Road Test') &&administer_written_test(registrant) == true
        registrant.pass_road
        true
      else
        false
      end
    end
  
    def renew_drivers_license(registrant)
      if @services.include?('Renew License') && registrant.license? == true && administer_road_test(registrant) == true
        registrant.renew_license
        true
      else
        false
      end
    end
end