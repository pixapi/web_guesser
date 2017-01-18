require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = rand(100)
  if params["guess"].to_i > number
    message = "Too high!"
  elsif params["guess"].to_i == number
    "You got it right!"
  else
    message = "Too low!"
  end
  erb :index, :locals => {:number => number, :message => message}
end
