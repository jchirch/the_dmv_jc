class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

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
    return unless @services.include?('Vehicle Registration')
      vehicle.set_registration_date
      vehicle.set_plate_type
      @collected_fees += vehicle.plate_fees
      @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    return false unless registrant.age >= 16 && registrant.permit?
    registrant.pass_written
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test')
    return false unless administer_written_test(registrant)
    registrant.pass_road
  end
  
  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License')
    return false unless registrant.license? == true && administer_road_test(registrant)
    registrant.renew_license
  end
end