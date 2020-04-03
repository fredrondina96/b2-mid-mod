require "rails_helper"

RSpec.describe "As a user when I visit a mechanics show page", type: :feature do
  it "should display a mechanics name and years of experience" do
    jimbo = Mechanic.create!(name: "Jimbo", years_of_expierence: 13)

    visit "/mechanics/#{jimbo.id}"

    expect(page).to have_content(jimbo.name)
    expect(page).to have_content(jimbo.years_of_expierence)
  end

  it "should display the names of all rides they're working on" do
    jimbo = Mechanic.create!(name: "Jimbo", years_of_expierence: 13)

    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)

    jimbo.rides <<  montu
    jimbo.rides <<  kumba

    visit "/mechanics/#{jimbo.id}"

    expect(page).to have_content("Rides Currently Working On")
    expect(page).to have_content(montu.name)
    expect(page).to have_content(kumba.name)

  end
end

# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
