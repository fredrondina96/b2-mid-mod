require "rails_helper"

RSpec.describe "When user visits a rides show page", type: :feature do
  it "Shows the rides state" do

    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    zebra = busch_gardens.rides.create!(name: "Zippin Zebra", thrill_rating: 4)
    kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)

    visit "/rides/#{montu.id}"

    expect(page).to have_content(montu.name)
    expect(page).to have_content(montu.thrill_rating)
  end

  it "lists all rides that have the same thrill rating" do
    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    zebra = busch_gardens.rides.create!(name: "Zippin Zebra", thrill_rating: 4)
    kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 8)
    gwazi = busch_gardens.rides.create!(name: "Gwazi", thrill_rating: 8)

    visit "/rides/#{montu.id}"

    expect(page).to have_content("Rides with Same Thrill Rating")
    expect(page).to have_link(kumba.name)
    expect(page).to have_link(gwazi.name)
    expect(page).to_not have_link(zebra.name)

  end
end

# As a user,
# When I go to a rides show page
# I see that ride's name, and thrill rating
# I also see a section on the page that is titled "Rides with the same thrill rating."
# Under that title, I see a list of rides from that same park with the same thrill rating of this ride.
