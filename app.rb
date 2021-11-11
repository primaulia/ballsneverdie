require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  "Hello world!"
end


# TODO
# Create DB Visualization between Team and Players - 1 TEAM : N PLAYERS ✅
# Create DB Visualization between Team and Games - 1 GAME : N TEAMS ✅

# Create Migration for Teams Table