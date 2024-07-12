require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
     @registrant_1 = Registrant.new('Bruce', 18, true)
     @registrant_2 = Registrant.new('Penny', 16)
     @registrant_3 = Registrant.new('Tucker', 15)
    end
    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_2).to be_an_instance_of(Registrant)
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_2.name).to eq('Penny')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_2.age).to eq(16)
            expect(@registrant_2.permit).to be false
            expect(@registrant_1.permit).to be true
        end
    end
    describe '#permit?' do
        it 'can determine if registrant has permit' do
            expect(@registrant_1.permit?).to be true
            expect(@registrant_2.permit?).to be false
        end
    end
    describe '#earn_permit' do
        it 'can earn permit' do
            expect(@registrant_2.permit?).to be false
            expect(@registrant_2.earn_permit).to be true
        end
    end
    describe '#license data' do
        it 'can access license data' do
            expect(@registrant_1.license_data[:written]).to be false
            expect(@registrant_1.license_data[:license]).to be false
            expect(@registrant_1.license_data[:license]).to be false
        end
    end
end