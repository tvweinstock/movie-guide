require_relative 'movie'
require_relative 'tmdb'


require 'sinatra'

@@tmdb = Tmdb.new

get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movies' do 
  erb :movies
end

get '/movies/new' do
  erb :new_movie
end