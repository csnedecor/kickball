require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get '/' do
  file = File.read("roster.json")
  @roster = JSON.parse(file)
  @teams = []
  @roster.each_key{|team| @teams << team}
  @roster.each do |team, players|
    @players = players
  end
  erb :index
end

get '/teams/:team_name' do
  file = File.read("roster.json")
  @roster = JSON.parse(file)
  @team = params[:team_name]
  @players = @roster[@team]
  erb :show
end

get '/position/:position_name' do
  file = File.read("roster.json")
  @roster = JSON.parse(file)
  @position = params[:position_name]
  erb :position
end
