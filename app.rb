# TODO
# Create DB Visualization between Team and Players - 1 TEAM : N PLAYERS ✅
# Create DB Visualization between Team and Games - 1 GAME : N TEAMS ✅

# Create Migration for Teams Table ✅

# Create model file ==> `team.rb` ✅
# Seed the teams data from API ✅

require_relative "config/application"
require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

set :views, (proc { File.join(root, "views") })
set :bind, '0.0.0.0'

# router + controller


# As a/an <ACTOR> i can <ACTION> so that <VALUE - OPTIONAL>
# User --> '/' ==> as a user i want to see all the teams in the DB at routes '/home'
# GET request to '/home'
get "/" do
  # DB --> Model
  @teams =Team.all
  erb :home
end