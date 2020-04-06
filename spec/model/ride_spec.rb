require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
  end

  describe "relationships" do
      it {should belong_to :park}
      it {should have_many :mechanic_rides}
      it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe "rides_with_same_thrill_rating" do
    it "returns all rides with same thrill rating" do
      busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

      montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
      zebra = busch_gardens.rides.create!(name: "Zippin Zebra", thrill_rating: 4)
      kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 8)
      gwazi = busch_gardens.rides.create!(name: "Gwazi", thrill_rating: 8)

      expect(montu.rides_with_same_thrill_rating).to include(kumba, gwazi)
    end
  end
end
