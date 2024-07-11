class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(hash)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_services(service)
    @services.push(service)
  end
end
