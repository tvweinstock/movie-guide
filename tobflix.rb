require_relative 'movie'
require_relative 'tmdb'

require 'sinatra'



get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movies' do 
  @movie_app_name = "Tobflix"
  erb :movies
end