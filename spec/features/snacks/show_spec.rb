require "rails_helper"

RSpec.describe "Snack Show", type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons = @owner.machines.create(location: "Don's Mixed Drinks")
    @turing = @owner.machines.create(location: "Turing's Basement")
    @sarah = @owner.machines.create(location: "Sarah's Snacks")

    @burger = Snack.create(name: "White Castle Burger", price: 3.50)
    @pop_rocks = Snack.create(name: "Pop Rocks", price: 1.50)
    @cheetos = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)
    @chocolate = Snack.create(name: "Hershey's", price: 2.50)
    @skittles = Snack.create(name: "Skittle's", price: 4.50)

    MachineSnack.create(machine: @dons, snack: @burger)
    MachineSnack.create(machine: @dons, snack: @pop_rocks)
    MachineSnack.create(machine: @dons, snack: @cheetos)
    MachineSnack.create(machine: @turing, snack: @burger)
    MachineSnack.create(machine: @turing, snack: @skittles)
    MachineSnack.create(machine: @sarah, snack: @burger)
  end
  describe "when I visit a snack show page" do
    scenario "I see the name and price of the snack, list of locations with vending machines that carry that snack, average price for snacks in those vending machines, and count of the different kinds of items in that vending machine" do
      visit snack_path(@burger)

      expect(page).to have_content(@burger.name)
      expect(page).to have_content("Price: $#{@burger.price}")

      within("#locations") do
        expect(page).to have_content("Don's Mixed Drinks (3 kind(s) of snacks, average price of $2.50)")
        expect(page).to have_content("Turing's Basement (2 kind(s) of snacks, average price of $4.00)")
        expect(page).to have_content("Sarah's Snacks (1 kind(s) of snacks, average price of $3.50)")
      end
    end
  end
end