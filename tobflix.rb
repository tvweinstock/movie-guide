require_relative 'movie'
require_relative 'tmdb'


require 'sinatra'

@@tmdb = Tmdb.new

get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movie' do 
  erb :movies
end

get '/movies/new' do
  erb :new_movie
end

post '/movie' do
  new_movie = Movie.new(params[:title], params[:year], params[:genre], params[:priority])
  @@tmdb.add_title(new_movie)
  redirect to ('/movie')
end