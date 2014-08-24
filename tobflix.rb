require_relative 'movie'
require_relative 'tmdb'


require 'sinatra'

@@tmdb = Tmdb.new

get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movies' do 
@movie = []
@movie << Movie.new('Titanic', 1997, 'Drama')
@movie << Movie.new('Some Like it Hot', 1959, 'Comedy')
@movie << Movie.new('Monster\'s Inc', 2001, 'Family')
  erb :movies
end

get '/movies/new' do
  erb :new_movie
end