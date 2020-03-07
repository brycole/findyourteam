# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

games = [{ title: "Dota2", genre: "MOBA" },
         { title: "CS: GO", genre: "FPS" },
         { title: "Overwatch", genre: "FPS" }]
games.each do |game|
  game = Game.new(game)
  game.save
end

dota2 = Game.find_by(title: "Dota2")
csgo = Game.find_by(title: "CS: GO")

dota_rank_names = ["Herald", "Guardian", "Crusader", "Archon", "Legend", "Ancient", "Divine", "Immortal"]
dota_inner_ranking = ["I", "II", "III", "IV", "V"]
ranking = 0
image_file = "dota-rank"

puts "Generating Dota 2 ranks..."
for i in dota_rank_names
  for x in dota_inner_ranking do
    ranking = ranking + 1
    temp_file = image_file.dup
    temp_file << "#{ranking}.png"
    rank = Rank.new
    puts "Adding rank #{i} #{x}"
    rank.name = "#{i} #{x}"
    rank.rank_position = ranking
    rank.image = temp_file
    rank.game = dota2
    rank.save
    break if ranking == 38
  end
  break if rank == 38
end

rank_names_csgo = ["Silver I", "Silver II", "Silver III", "Silver IV", "Silver Elite", "Silver Elite Master", "Gold Nova I", "Gold Nova II", "Gold Nova III", "Gold Nova Master", "Master Guardian I", "Master Guardian II", "Master Guardian Elite", "Distinguished Master Guardian", "Legendary Eagle", "Legendary Eagle Master", "Supreme Master First Class", "The Global Elite"]
rank_position_csgo = [*1..18]
image_file = "cs-rank"

puts "Generating CS:GO ranks..."
rank_position_csgo.each do |i|
  temp_file = image_file.dup
  temp_file << "#{i}.png"
  rank = Rank.new
  puts "Adding rank #{rank_names_csgo[i-1]}..."
  rank.name = rank_names_csgo[i-1]
  # puts "Rank_position...#{i}"
  rank.rank_position = i
  #  puts temp_file
  rank.image = temp_file
  rank.game = csgo
  rank.save
end


position_names_dota2 = ["Jungler", "Carry", "Solo", "Offlaner", "Support"]
position_names_csgo = ["Fragger", "Leader", "AWPer", "Lurker", "Playmaker", "Secondary AWPer"]

position_names_dota2.each do |position_name|
  position_name = PositionName.new(name: position_name)
  game = dota2
  position_name.game = game
  position_name.save
end

position_names_csgo.each do |position_name|
  position_name = PositionName.new(name: position_name)
  game = csgo
  position_name.game = game
  position_name.save
end

puts 'Creating users'

User.create!(
  email: 'vladi@gmail.com',
  password: 'password',
  nickname: 'Destroyer',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 28),
  position_name_id: dota2.position_names.first.id)

rank = Rank.find_by(id: 28)

User.create!(
  email: 'rachid@gmail.com',
  password: 'password',
  nickname: 'Fly',
  show_game: csgo,
  game: dota2,
  rank: Rank.find_by(id: 16),
  position_name_id: dota2.position_names.first.id)

User.create!(
  email: 'bryan@gmail.com',
  password: 'password',
  nickname: 'Miracle',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 38),
  position_name_id: dota2.position_names.first.id)

User.create!(
  email: 'atsede@gmail.com',
  password: 'password',
  nickname: 'kill_bill',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 12),
  position_name_id: dota2.position_names.first.id)

User.create!(
  email: 'bob@gmail.com',
  password: 'password',
  nickname: 'Resolution',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 34),
  position_name_id: dota2.position_names.first.id)

User.create!(
  email: 'sarah@gmail.com',
  password: 'password',
  nickname: 's5',
  show_game: dota2,
  game: csgo,
  rank: Rank.find_by(id: 24),
  position_name_id: csgo.position_names.first.id)

User.create!(
  email: 'scott@gmail.com',
  password: 'password',
  nickname: 'Ceb',
  show_game: csgo,
  game: csgo,
  rank: Rank.find_by(id: 54),
  position_name_id: csgo.position_names.first.id)

User.create!(
  email: 'finn@gmail.com',
  password: 'password',
  nickname: 'Topson',
  show_game: csgo,
  game: csgo,
  rank: Rank.find_by(id: 56),
  position_name_id: csgo.position_names.first.id)

User.create!(
  email: 'beyonce@gmail.com',
  password: 'password',
  nickname: 'NBK',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 4),
  position_name_id: dota2.position_names.first.id)

User.create!(
  email: 'tupac@gmail.com',
  password: 'password',
  nickname: 'QO',
  show_game: csgo,
  game: csgo,
  rank: Rank.find_by(id: 42),
  position_name_id: csgo.position_names.first.id)

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



