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

  it "has a form where I can add existing rides to mechanics workload" do
    jimbo = Mechanic.create!(name: "Jimbo", years_of_expierence: 13)

    busch_gardens = Park.create!(name: "Busch Gardens", admission_price: 50)

    montu = busch_gardens.rides.create!(name: "Montu", thrill_rating: 8)
    kumba = busch_gardens.rides.create!(name: "Kumba", thrill_rating: 7)

    jimbo.rides <<  montu

    visit "/mechanics/#{jimbo.id}"

    expect(page).to have_content(montu.name)
    expect(page).to_not have_content(kumba.name)

    fill_in "ride_id", with: "#{kumba.id}"
    click_button "Add Ride"

    expect(current_path).to eq("/mechanics/#{jimbo.id}")
    expect(page).to have_content(kumba.name)
    expect(page).to have_content(montu.name)
  end
end
