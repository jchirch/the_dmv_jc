require 'dmv_data_service'

class VehicleFactory

    def initialize

    end

    def create_vehicles(dmv_registrations)
        dmv_registrations.map do |registration|
            vehicle_data = {}
            vehicle_data[:vin] = registration[:vin_1_10],
            vehicle_data[:year] = registration[:model_year],
            vehicle_data[:make] = registration[:make],
            vehicle_data[:model] = registration[:model],
            vehicle_data[:engine] = :ev
            # vehicle_data[:registration_date] = registration[:transaction_date],
            # do registration date?
            # dont do plate type
            # repeat for all desired
            Vehicle.new(vehicle_data)
        end

    end


end

# :electric_vehicle_type,
#  :vin_1_10,
#  :dol_vehicle_id,
#  :model_year,
#  :make,
#  :model,
#  :vehicle_primary_use,
#  :electric_range,
#  :odometer_reading,
#  :odometer_code,
#  :new_or_used_vehicle,
#  :sale_price,
#  :base_msrp,
#  :transaction_type,
#  :transaction_date,
#  :transaction_year,
#  :county,
#  :city,
#  :state_of_residence,
#  :zip,
#  :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility,
#  :meets_2019_hb_2042_electric_range_requirement,
#  :meets_2019_hb_2042_sale_date_requirement,
#  :meets_2019_hb_2042_sale_price_value_requirement,
#  :_2019_hb_2042_battery_range_requirement,
#  :_2019_hb_2042_purchase_date_requirement,
#  :_2019_hb_2042_sale_price_value_requirement,
#  :electric_vehicle_fee_paid,
#  :transportation_electrification_fee_paid,
#  :hybrid_vehicle_electrification_fee_paid,
#  :census_tract_2020,
#  :legislative_district,
#  :electric_utility