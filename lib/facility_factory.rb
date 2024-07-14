class FacilityFactory

    def initialize

    end

    def create_facility(dmv_locations)
        dmv_locations.map do |location|
            location_data = {}

            location_data[:address] = "#{location[:address_li]} #{location[:address_1]} #{location[:city]} #{location[:state]} #{location[:zip]}"
            location_data[:phone] = location[:phone]
            location_data[:name] = location[:dmv_office]

            Facility.new(location_data)
        end
    end
end
