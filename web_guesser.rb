require 'sinatra'
require 'sinatra/reloader'

get '/' do
  guess = params["guess"].to_i
  number = rand(100).to_i
  if guess - number > 5
    message = "Way too high!"
  elsif number - guess > 5
    message = "Way too low!"
  elsif guess > number
    message = "Too high!"
  elsif guess < number
    message = "Too low!"
  else
    message = "The SECRET NUMBER is #{number}"
  end
  erb :index, :locals => {:number => number, :message => message}
end
