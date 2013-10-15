get '/' do
  erb :index
end


post '/play_game' do
  params.each do |key, value|
    session["#{key}"] = User.find_or_create_by_username(username: value)
  end
  # session['player_1'] = User.find_or_create_by_username(username: params[:player1])
  # session['player_2'] = User.find_or_create_by_username(username: params[:player2])

  # if session['player_1'] == session['player_2'] 
  #   return "Stop being a fuckup"
  # end

end

get '/play_game' do
  @player_counter = params[:player_count].to_i
  puts @player_counter.inspect
  puts @player_counter.class
  erb :racecar
end

post '/game_over' do
  @winner = session["player_#{params[:winner]}"]
  Game.create(duration: params[:duration], winner: @winner.username)
end

get '/append_user' do
  erb :append_user
end

get '/add_rows' do
  erb :add_rows
end
