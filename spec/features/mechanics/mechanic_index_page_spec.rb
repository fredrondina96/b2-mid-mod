require "rails_helper"

RSpec.describe "When a User visits the Mechanic index page", type: :feature do
  it "User sees list of all mechanics names and their years of experience" do
    jimbo = Mechanic.create!(name: "Jimbo", years_of_expierence: 13)
    bobby = Mechanic.create!(name: "Bobby", years_of_expierence: 9)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(jimbo.name)
    expect(page).to have_content(jimbo.years_of_expierence)

    expect(page).to have_content(bobby.years_of_expierence)
    expect(page).to have_content(bobby.name)
  end
end
