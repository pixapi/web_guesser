require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  number = @number
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  @number = rand(100).to_i
  if guess.to_i - @number > 5
    "Way too high!"
  elsif @number - guess.to_i > 5
    "Way too low!"
  elsif guess.to_i > @number
    "Too high!"
  elsif guess.to_i < @number
    "Too low!"
  else
    "The SECRET NUMBER is #{@number}"
  end
end
