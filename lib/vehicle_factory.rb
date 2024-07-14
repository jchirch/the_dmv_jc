class VehicleFactory

    def initialize

    end

    def create_vehicles(dmv_registrations)
        dmv_registrations.map do |registration|
            vehicle_data = {}
           
            vehicle_data[:vin] = registration[:vin_1_10]
            vehicle_data[:year] = registration[:model_year]
            vehicle_data[:make] = registration[:make]
            vehicle_data[:model] = registration[:model]
            vehicle_data[:engine] = :ev
            
            # vehicle_data[:registration_date] = registration[:transaction_date],
            # do registration date?
            # dont do plate type
            Vehicle.new(vehicle_data)
        end 
    end
end

# {
#     "electric_vehicle_type": "Battery Electric Vehicle (BEV)",
#     "vin_1_10": "3C3CFFGE5F",
#     "dol_vehicle_id": "242052954",
#     "model_year": "2015",
#     "make": "FIAT",
#     "model": "500",
#     "vehicle_primary_use": "Passenger",
#     "electric_range": "87",
#     "odometer_reading": "0",
#     "odometer_code": "Odometer reading is not collected at time of renewal",
#     "new_or_used_vehicle": "Used",
#     "sale_price": "0",
#     "base_msrp": "0",
#     "transaction_type": "Registration Renewal",
#     "transaction_date": "2022-09-26T00:00:00.000",
#     "transaction_year": "2022",
#     "county": "Whatcom",
#     "city": "EVERSON",
#     "state_of_residence": "WA",
#     "zip": "98247",
#     "hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility": "HB 2042 Eligibility Requirements not met",
#     "meets_2019_hb_2042_electric_range_requirement": true,
#     "meets_2019_hb_2042_sale_date_requirement": false,
#     "meets_2019_hb_2042_sale_price_value_requirement": false,
#     "_2019_hb_2042_battery_range_requirement": "Battery range requirement is met",
#     "_2019_hb_2042_purchase_date_requirement": "This transaction type is not eligible for the tax exemption",
#     "_2019_hb_2042_sale_price_value_requirement": "This transaction type is not eligible for the tax exemption",
#     "electric_vehicle_fee_paid": "Yes",
#     "transportation_electrification_fee_paid": "Yes",
#     "hybrid_vehicle_electrification_fee_paid": "No",
#     "census_tract_2020": "53073010701",
#     "legislative_district": "42",
#     "electric_utility": "PUGET SOUND ENERGY INC||PUD NO 1 OF WHATCOM COUNTY"
#   }