require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  if params["cheat"] == "true"
    @color = "blue"
    message = "The number is #{SECRET_NUMBER}. Cheater."
  else
    message = check_guess(guess)
  end
  erb :index, :locals => {:color => @color, :message => message}
end

def check_guess(guess)
  if guess - SECRET_NUMBER > 5
    @color = "red"
    "Way too high!"
  elsif SECRET_NUMBER - guess > 5
    @color = "red"
    "Way too low!"
  elsif guess > SECRET_NUMBER
    @color = "lightcoral"
    "Too high!"
  elsif guess < SECRET_NUMBER
    @color = "lightcoral"
    "Too low!"
  elsif guess == SECRET_NUMBER
    @color = "green"
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
