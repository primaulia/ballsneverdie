# TODO: create all teams based on the API given

# call the get all teams API
# url = "https://www.balldontlie.io/api/v1/teams"

# for each of 30 teams that you get from the JSON
# create one team in your DB

require 'open-uri'
require 'json'
require 'pry-byebug'

# BAE 
puts "Setup the db"
Team.destroy_all

puts "Start of the seed 🏀"
# call the api
  # get results --> see the api response
  # on each results (30 teams) ==> Team.create!(name: ??)
url = "https://www.balldontlie.io/api/v1/teams"
raw_json = open(url).read
parsed_json = JSON.parse(raw_json)

data = parsed_json['data']

data.each do |team_hash|
  team_name = team_hash["full_name"]
  puts "Seeding #{team_name} to the db 🚀"
  Team.create!(
    name: team_name
  )
end

# create players based on the api

players_api = "https://www.balldontlie.io/api/v1/players"
raw_json = open(players_api).read
parsed_json = JSON.parse(raw_json)
# binding.pry

data = parsed_json['data']

data.each do |player_hash|
  first_name = player_hash["first_name"]
  last_name = player_hash["last_name"]
  team_name = player_hash["team"]["full_name"]
  team_instance = Team.find_by_name(team_name)

  puts "Seeding #{first_name} #{last_name} to the db for team: #{team_name} 🚀"

  Player.create!(
    first_name: first_name,
    last_name: last_name,
    team: team_instance
  )
end

puts "End of the seeds 🙏"