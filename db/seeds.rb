require "open-uri"

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
  nickname: 'KillBill',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 12),
  position_name_id: dota2.position_names.first.id)

#dota 2 users
40.times do
  User.create!(
    email: Faker::Name.unique.first_name + '@gmail.com',
    password: 'password',
    nickname: Faker::Games::Heroes.unique.name,
    show_game: dota2,
    game: dota2,
    rank: Rank.find_by(id: rand(1..38)),
    position_name_id: dota2.position_names[rand(0..4)].id
    )
end

#cs go users
40.times do
  User.create!(
    email: Faker::Name.unique.first_name + '@gmail.com',
    password: 'password',
    nickname: Faker::Games::Fallout.character,
    show_game: csgo,
    game: csgo,
    rank: Rank.find_by(id: rand(1..18)),
    position_name_id: dota2.position_names[rand(0..4)].id
    )
end

puts 'Users created'

puts 'Creating Teams'

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/chaos_pgwdak.png')
team1 = Team.new(
  name: 'Chaos eSports',
  game_id: 1,
  user_id: 2)
team1.photo.attach(io: team_logo, filename: 'chaos.png', content_type: 'image/png')
team1.save
puts "team 1 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/eg_logo_idaeju.png')
team2 = Team.new(
  name: 'Evil Geniuses',
  game_id: 1,
  user_id: 2)
team2.photo.attach(io: team_logo, filename: 'Eagle.png', content_type: 'image/png')
team2.save
puts "team 2 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/infamous_bqoi88.png')
team3 = Team.new(
  name: 'Team Infamous',
  game_id: 1,
  user_id: 2)
team3.photo.attach(io: team_logo, filename: 'infamous.png', content_type: 'image/png')
team3.save
puts "team 3 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/fnatic_hfxb15.png')
team4 = Team.new(
  name: 'fnatic',
  game_id: 1,
  user_id: 2)
team4.photo.attach(io: team_logo, filename: 'fnatic.png', content_type: 'image/png')
team4.save
puts "team 4 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/alliance_logo_tseyw7.png')
team5 = Team.new(
  name: 'Alliance',
  game_id: 1,
  user_id: 2)
team5.photo.attach(io: team_logo, filename: 'alliance.png', content_type: 'image/png')
team5.save
puts "team 5 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/navi_logo_zgsc51.png')
team6 = Team.new(
  name: 'Natus Vincere',
  game_id: 1,
  user_id: 2)
team6.photo.attach(io: team_logo, filename: 'navi.png', content_type: 'image/png')
team6.save
puts "team 6 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/newbee_logo_wrlrol.png')
team7 = Team.new(
  name: 'Team Newbee',
  game_id: 1,
  user_id: 2)
team7.photo.attach(io: team_logo, filename: 'newbee.png', content_type: 'image/png')
team7.save
puts "team 7 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/nip_logo_gec1ws.png')
team8 = Team.new(
  name: 'Ninjas in Pyjamas',
  game_id: 1,
  user_id: 2)
team8.photo.attach(io: team_logo, filename: 'nip.png', content_type: 'image/png')
team8.save
puts "team 8 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584529537/logos_for_seeds/liquid_hfbtns.png')
team9 = Team.new(
  name: 'Team Liquid',
  game_id: 1,
  user_id: 2)
team9.photo.attach(io: team_logo, filename: 'liquid.png', content_type: 'image/png')
team9.save
puts "team 9 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/keen_logo_ugbzs4.png')
team10 = Team.new(
  name: 'Team Keen',
  game_id: 1,
  user_id: 2)
team10.photo.attach(io: team_logo, filename: 'keen.png', content_type: 'image/png')
team10.save
puts "team 10 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528719/logos_for_seeds/predator_logo_w9du2i.png')
team11 = Team.new(
  name: 'Team Predator',
  game_id: 2,
  user_id: 2)
team11.photo.attach(io: team_logo, filename: 'predator.png', content_type: 'image/png')
team11.save
puts "team 11 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528719/logos_for_seeds/virtuspro_logo_idp1bf.png')
team12 = Team.new(
  name: 'Virtus.pro',
  game_id: 1,
  user_id: 2)
team12.photo.attach(io: team_logo, filename: 'virtus_pro.png', content_type: 'image/png')
team12.save
puts "team 12 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528718/logos_for_seeds/mineski_logo_uwia3d.png')
team13 = Team.new(
  name: 'Team Mineski',
  game_id: 2,
  user_id: 2)
team13.photo.attach(io: team_logo, filename: 'mineski.png', content_type: 'image/png')
team13.save
puts "team 13 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528719/logos_for_seeds/psg_logo_mhv1m3.png')
team14 = Team.new(
  name: 'Team RNG',
  game_id: 2,
  user_id: 2)
team14.photo.attach(io: team_logo, filename: 'rng.png', content_type: 'image/png')
team14.save
puts "team 14 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528719/logos_for_seeds/vici_logo_trruzf.png')
team15 = Team.new(
  name: 'Vici Gaming',
  game_id: 2,
  user_id: 2)
team15.photo.attach(io: team_logo, filename: 'vici.png', content_type: 'image/png')
team15.save
puts "team 15 created."

team_logo = URI.open('https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584528719/logos_for_seeds/og_team_okwz3f.png')
team16 = Team.new(
  name: 'Team OG',
  game_id: 2,
  user_id: 2)
team16.photo.attach(io: team_logo, filename: 'team_og.png', content_type: 'image/png')
team16.save
puts "team 16 created."

puts 'Teams created'



# 5.times do
#   title = Faker::Food.dish
#   title.gsub!(/[^[:ascii:]]/, "")
#   category = Faker::Nation.language
#   price = Faker::Number.number(digits: 2)
#   cooking_time = (Faker::Number.number(digits: 2)).to_s + "min"
#   description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
#   input_hash = {title: title, category: category, price: price, cooking_time: cooking_time, description: description}
#   meal = Meal.new(input_hash)
#   meal.user = user1

#   photo = "https://source.unsplash.com/random/?dinner " + title
#   file = URI.open(photo)
#   meal.photo.attach(io: file, filename: 'test.jpeg', content_type: 'image/png')

#   puts "Adding address...#{post_code[0]}"
#   meal.address = post_code.slice!(0)
#   meal.save
#   sleep(2)
# end
