# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

games = [{ title: "Dota2", genre: "MOBA" }, { title: "CS: GO", genre: "FPS" }, { title: "League of Legends", genre: "MOBA" }]
games.each do |game|
  game = Game.new(game)
  game.save
end

position_names_dota2 = ["Jungler", "Carry", "Solo", "Offlaner", "Support"]
position_names_csgo = ["Fragger", "Leader", "AWPer", "Lurker", "Playmaker", "Secondary AWPer"]

position_names_dota2.each do |position_name|
  position_name = PositionName.new(name: position_name)
  game = Game.find_by(title: "Dota2")
  position_name.game = game
  position_name.save
end

position_names_csgo.each do |position_name|
  position_name = PositionName.new(name: position_name)
  game = Game.find_by(title: "CS: GO")
  position_name.game = game
  position_name.save
end
