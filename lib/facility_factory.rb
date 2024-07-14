class FacilityFactory

    def initialize

    end

    def create_co_facility(dmv_locations)
        dmv_locations.map do |location|
            location_data = {}

            location_data[:name] = location[:dmv_office]
            location_data[:address] = "#{location[:address_li]} #{location[:address__1]} #{location[:city]} #{location[:state]} #{location[:zip]}"
            location_data[:phone] = location[:phone]
            
            Facility.new(location_data)
        end
    end

    def create_ny_facility(dmv_locations)
        dmv_locations.map do |location|
            location_data = {}

            location_data[:name] = location[:office_name]
            location_data[:phone] = location[:public_phone_number]
            location_data[:address] = "#{location[:street_address_line_1]} #{location[:city]} #{location[:state]} #{location[:zip_code]}"
            
            Facility.new(location_data)
        end
    end
end
