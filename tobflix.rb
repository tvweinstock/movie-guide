require_relative 'movie'
require_relative 'tmdb'


require 'sinatra'

@@tmdb = Tmdb.new
@@tmdb.add_title(Movie.new("Fargo", 1999, "Crime", 1))

get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movie' do 
  erb :movies
end

get '/movie/new' do
  erb :new_movie
end

post '/movie' do
  new_movie = Movie.new(params[:title], params[:year], params[:genre], params[:priority])
  @@tmdb.add_title(new_movie)
  redirect to ('/movie')
end

get "/movie/:id" do 
  @movie = @@tmdb.find(params[:id].to_i)
  if @movie
  erb :show_movie
else
  raise Sinatra::NotFound
  end
end 