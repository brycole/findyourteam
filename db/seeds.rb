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
  password: 'password',
  nickname: 'Destroyer',
  show_game: 'Dota2',
  rank: 4)

User.create!(
  email: 'rachid@gmail.com',
  password: 'password',
  nickname: 'Fly',
  show_game: 'CS: GO',
  rank: 2)

User.create!(
  email: 'bryan@gmail.com',
  password: 'password',
  nickname: 'Miracle',
  show_game: 'LoL',
  rank: 3)

User.create!(
  email: 'atsede@gmail.com',
  password: 'password',
  nickname: 'kill_bill',
  show_game: 'Dota2',
  rank: 1)

User.create!(
  email: 'bob@gmail.com',
  password: 'password',
  nickname: 'Resolution',
  show_game: 'LoL',
  rank: 5)

User.create!(
  email: 'sarah@gmail.com',
  password: 'password',
  nickname: 's5',
  show_game: 'Dota2',
  rank: 6)

User.create!(
  email: 'scott@gmail.com',
  password: 'password',
  nickname: 'Ceb',
  show_game: 'CS: GO',
  rank: 7)

User.create!(
  email: 'finn@gmail.com',
  password: 'password',
  nickname: 'Topson',
  show_game: 'LoL',
  rank: 8)

User.create!(
  email: 'beyonce@gmail.com',
  password: 'password',
  nickname: 'NBK',
  show_game: 'Dota2',
  rank: 9)

User.create!(
  email: 'tupac@gmail.com',
  password: 'password',
  nickname: 'QO',
  show_game: 'LoL',
  rank: 10)

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



