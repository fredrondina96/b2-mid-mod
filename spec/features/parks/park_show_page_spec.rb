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

  it "I see all of the rides at the park listed alphabetically" do
    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    zebra = busch_gardens.rides.create!(name: "Zippin Zebra", thrill_rating: 4)
    kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)

    visit "/amusmant_parks/#{busch_gardens.id}"

    expect(page).to have_content("1: #{kumba.name}")
    expect(page).to have_content("2: #{montu.name}")
    expect(page).to have_content("3: #{zebra.name}")
  end

  it "I see the average thrill rating of the parks rides" do
    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    cheeta_chase = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 2)

    visit "/amusmant_parks/#{busch_gardens.id}"

    expect(page).to have_content("Average Ride Thrill Rating: 5.0")
  end
end
