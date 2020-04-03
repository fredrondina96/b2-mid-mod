require 'rails_helper'

RSpec.describe Park, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :admission_price }
  end

  describe 'relationships' do
    it { should have_many :rides }
  end

  describe "ordered_rides" do
    it "should return all of a parks rides in alphabetical order" do
      busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

      montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
      kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)
      alligator = busch_gardens.rides.create!(name: "Alligator", thrill_rating: 6)

      expect(busch_gardens.ordered_rides.first).to eq(alligator)
    end
  end

  describe "average_thrill_rating" do
    it "should return average of all rides thrill rating" do
      busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

      montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 10)
      kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)

      expect(busch_gardens.average_thrill_rating).to eq(8.5)
    end
  end


end
