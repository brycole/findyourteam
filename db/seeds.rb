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

vladi = User.new(
  email: 'vladi@gmail.com',
  password: 'password',
  nickname: 'Destroyer',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 28),
  position_name_id: dota2.position_names.first.id)
pic_url = "https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584800608/logos_for_seeds/vladi_pkbwu3.jpg"
avatar = URI.open(pic_url)
vladi.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
vladi.save

rank = Rank.find_by(id: 28)

rachid = User.new(
  email: 'rachid@gmail.com',
  password: 'password',
  nickname: 'Fly',
  show_game: csgo,
  game: dota2,
  rank: Rank.find_by(id: 16),
  position_name_id: dota2.position_names.first.id)
pic_url = "https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584800608/logos_for_seeds/rachid_gamjxo.jpg"
avatar = URI.open(pic_url)
rachid.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
rachid.save

bryan = User.new(
  email: 'bryan@gmail.com',
  password: 'password',
  nickname: 'Miracle',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 38),
  position_name_id: dota2.position_names.first.id)
pic_url = "https://res.cloudinary.com/dm4nbcc5v/image/upload/v1584800608/logos_for_seeds/atsede_wdvqbl.jpg"
avatar = URI.open(pic_url)
bryan.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
bryan.save

atsede = User.new(
  email: 'atsede@gmail.com',
  password: 'password',
  nickname: 'KillBill',
  show_game: dota2,
  game: dota2,
  rank: Rank.find_by(id: 12),
  position_name_id: dota2.position_names.first.id)
pic_url = "https://avatars2.githubusercontent.com/u/22333099?v=4"
avatar = URI.open(pic_url)
atsede.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
atsede.save
#dota 2 users

40.times do
  user = User.new(
    email: Faker::Name.unique.first_name + '@gmail.com',
    password: 'password',
    nickname: Faker::Games::Heroes.unique.name,
    show_game: "1",
    game: dota2,
    rank: Rank.find_by(id: rand(1..38)),
    position_name_id: dota2.position_names[rand(0..4)].id
    )
    pic_url = "https://source.unsplash.com/random/?face"
    avatar = URI.open(pic_url)
    user.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
    user.save
    sleep(1)
end

#cs go users

40.times do
  user = User.new(
    email: Faker::Name.unique.first_name + '@gmail.com',
    password: 'password',
    nickname: Faker::Games::Fallout.character,
    show_game: "2",
    game: csgo,
    rank: Rank.where(game_id: 2)[rand(0..17)],
    position_name_id: csgo.position_names[rand(0..4)].id
    )
    pic_url = "https://source.unsplash.com/random/?face"
    avatar = URI.open(pic_url)
    user.photo.attach(io: avatar, filename: 'random.jpeg', content_type: 'image/png')
    user.save
    sleep(1)
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

puts 'seeding positions to teams'
# seed positions to teams
dota2 = %w[Carry Jungler Offlaner Support Support]
csgo = %w[Leader Fragger AWPer Lurker Playmaker]

Team.where(game_id: 1).each do |team|
  dota2.each do |position_name|
    position = Position.new
    position.team = team
    position_name = PositionName.find_by(name: position_name)
    position.position_name = position_name
    position.save
  end
end

Team.where(game_id: 2).each do |team|
  csgo.each do |position_name|
    position = Position.new
    position.team = team
    position_name = PositionName.find_by(name: position_name)
    position.position_name = position_name
    position.save
  end
end

puts "Adding users to existing positions..."

[1,2].each do |game_loop|
  users = User.all
  users = users.map do |user|
    user if user.game_id == game_loop
  end
  users = users.reject{ |x| x.nil?}
  # puts users.count

  Position.all.each do |position|
    # puts "game_loop: #{game_loop}"
    if position.user_id
      # puts "position has a user"
      # puts position.user_id
      next
    end
    users.each do |user|
      if user.position_name.id == position.position_name.id &&
         user.position_name.game.id == position.position_name.game.id
          # puts "position found #{position.id}"
          # puts users.count
          random_user = rand(0..users.count)
          position.user = users[random_user]
          users.delete_at(random_user)
          position.save
          break
      else
        # puts "position not found"
      end
    end
  end
end
