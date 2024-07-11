class Registrant

    attr_reader :name, :age, :permit, :license_data

    def initialize(registrant_details)
        @name = registrant_details[:name]
        @age = registrant_details[:age]
        @permit = false
    end

    def permit?
        @permit = true
    end
end