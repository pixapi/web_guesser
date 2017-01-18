require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = @color
  erb :index, :locals => {:color => color, :message => message}
end

def check_guess(guess)
  number = rand(100).to_i
  if guess.to_i - number > 5
    @color = "red"
    "Way too high!"
  elsif number - guess.to_i > 5
    @color = "red"
    "Way too low!"
  elsif guess.to_i > number
    @color = "lightcoral"
    "Too high!"
  elsif guess.to_i < number
    @color = "lightcoral"
    "Too low!"
  else
    @color = "green"
    "The SECRET NUMBER is #{number}"
  end
end
