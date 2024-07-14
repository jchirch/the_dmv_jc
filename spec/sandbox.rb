require './lib/dmv_data_service'
ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

ny_dmv_office_locations.each do |x|
    x.default = "na"
    puts x[:public_phone_number].class
    # puts x[:public_phone_number]
end