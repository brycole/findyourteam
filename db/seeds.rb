# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


games = [{ title: "Dota2", genre: "MOBA" },
         { title: "CS: GO", genre: "FPS" },
         { title: "League of Legends", genre: "MOBA" }]
games.each do |game|
  game = Game.new(game)
  game.save
end



 t.string :name
      t.integer :rank_position
      t.string :image
      t.references :game, foreign_key: true

game = Game.find_by(title: "CS: GO")
rank_names_csgo = ["Silver I", "Silver II", "Silver III", "Silver IV", "Silver Elite", "Silver Elite Master", "Gold Nova I", "Gold Nova II", "Gold Nova III", "Gold Nova Master", "Master Guardian I", "Master Guardian II", "Master Guardian Elite", "Distinguished Master Guardian", "Legendary Eagle", "Legendary Eagle Master", "Supreme Master First Class", "The Global Elite"]
rank_position_csgo = [*1..18]
image_file = "cs-rank"

rank_position_csgo.each do |i|
  puts "Generating CS:GO ranks..."
  temp_file = image_file.dup
  temp_file << "#{i}.png"
  rank = Rank.new
  puts "Adding rank #{rank_names_csgo[i-1]}..."
  rank.name = rank_names_csgo[i-1]
  # puts "Rank_position...#{i}"
  rank.rank_position = i
  #  puts temp_file
  rank.image = temp_file
  rank.game = game
  rank.save
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

puts 'Creating users'

User.create!(
  email: 'vladi@gmail.com',
  password: 'password')

User.create!(
  email: 'rachid@gmail.com',
  password: 'password')

User.create!(
  email: 'bryan@gmail.com',
  password: 'password')

User.create!(
  email: 'atsede@gmail.com',
  password: 'password')

User.create!(
  email: 'bob@gmail.com',
  password: 'password')

puts 'Users created'


puts 'Creating Teams'

Team.create!(
  name: 'Team Secret',
  game_id: 1,
  user_id: 1)
puts "team 1 created."

Team.create!(
  name: 'Evil Geniuses',
  game_id: 2,
  user_id: 2)
puts "team 2 created."


Team.create!(
  name: 'Vici Gaming',
  game_id: 1,
  user_id: 3)
puts "team 3 created."


Team.create!(
  name: 'PSG.LGD',
  game_id: 2,
  user_id: 4)
puts "team 4 created."


Team.create!(
  name: 'Virtus.pro',
  game_id: 2,
  user_id: 5)
puts "team 5 created."


puts 'Teams created'



