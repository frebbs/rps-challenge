require 'sinatra/base'
require './lib/player'

class RPSO < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/api/attack' do
    session[:move] = params[:move]
    redirect '/move'
  end

  post '/api/submit_names' do
    @player_1_name = Player.create(params[:player_1_name])
    redirect '/play'
  end

  get '/move' do
    erb :move, :locals => {:player => Player.instance.name, :player_move => session[:move]}
  end

  get '/play' do
    erb :play, :locals => {:player => Player.instance.name}
  end




  run! if app_file == $0
end
