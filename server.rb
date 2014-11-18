require 'sinatra'
require 'json'
require 'pry'
file = File.read("roster.json")
roster = JSON.parse(file)

get '/' do
  erb :index
end

get '/teams/:team_name' do
  @team = params[:team_name]
  erb :show
end

get '/position/:position_name' do
  @position = params[:position_name]
  erb :position
end
