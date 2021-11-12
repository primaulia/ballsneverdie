# TODO: create all teams based on the API given

# call the get all teams API
# url = "https://www.balldontlie.io/api/v1/teams"

# for each of 30 teams that you get from the JSON
# create one team in your DB

require 'open-uri'
require 'json'
require 'pry-byebug'

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

puts "End of the seeds 🙏"