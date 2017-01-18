require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
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
