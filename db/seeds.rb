# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
