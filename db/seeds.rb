# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# sport = Sport.create(name: "Soccer")
# league = League.create(sport_id: 1, name: "Premier League")
# event = Event.create(league_id: 1, name: "Brighton vs New Castle")
# bet = Bet.create(event_id: 1, odds: -100)
# betslip = Betslip.new(bet_id: 1, amount: 100)

100.times do 
    Profile.create([{ name: Faker::Creature::Dog.name, match: 0.5 > rand() ? true : false, image: "https://placedog.net/640/480/?id=#{rand(1..200)}"}])
end

