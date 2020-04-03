require "rails_helper"

RSpec.describe "As a user, when is visit the parks show page", type: :feature do
  it "I see the name and admission price of the park" do
    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)
    universal = Park.create!(name: "Univsersal Studios", admission_price: 80)

    visit "/amusmant_parks/#{busch_gardens.id}"

    expect(page).to have_content(busch_gardens.name)
    expect(page).to have_content(busch_gardens.admission_price)

    visit "/amusmant_parks/#{universal.id}"

    expect(page).to have_content(universal.name)
    expect(page).to have_content(universal.admission_price)
  end

  it "I see all of the rides at the park" do
    
  end
end


# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
#
# Ex: Hershey Park
#     Admissions: $50.00
#
#     Rides:
#            1. Lightning Racer
#            2. Storm Runner
#            3. The Great Bear
#
#     Average Thrill Rating of Rides: 7.8/10
