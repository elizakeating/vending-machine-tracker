require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons = @owner.machines.create(location: "Don's Mixed Drinks")

    @burger = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @pop_rocks = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @cheetos = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
    @chocolate = Snack.create(name: "Hershey's", price: 2.50)

    visit machine_path(@dons)
  end
  scenario 'they see the location of that machine' do
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "I see the name of all of the snacks associated with that vending machine along with their price" do
    expect(page).to have_content("Snacks")

    within("#snacks") do
      expect(page).to have_content("White Castle Burger: $3.50")
      expect(page).to have_content("Pop Rocks: $1.50")
      expect(page).to have_content("Flaming Hot Cheetos: $2.50")
    end
  end

  scenario "I see the average price for all of the snacks in that machine" do
    expect(page).to have_content("Average Price: $2.50")
  end

  describe "I see a form to add an existing snack to that vending machine" do
    describe "When I fill in the form with the id of a snack that already exists and I click submit" do
      scenario "I am redirected to that vending machine's show page and the snack is now listed" do
        expect(page).to have_content("Add a Snack:")

        within("#add-snack") do
          expect(page).to have_content("Snack Id:")

          fill_in "Snack Id:", with: "#{@chocolate.id}"

          click_button "Submit"
        end

        expect(current_path).to eq(machine_path(@dons))

        within("#snacks") do
          expect(page).to have_content("Hershey's: $2.50")
        end
      end
    end
  end
end
