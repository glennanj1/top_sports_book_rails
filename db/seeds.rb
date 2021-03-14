# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sport = Sport.create(name: "Soccer")
league = League.create(name: "Premier League")
event = Event.create(name: "Brighton vs New Castle")
bet = Bet.create(odds: -100)
betslip = Betslip.new(amount: 100)

