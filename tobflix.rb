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
  else Sinatra::NotFound
  end
end

put "/movie/:id" do 
  @movie = @@tmdb.find(params[:id].to_i)
  if @movie
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.genre = params[:genre]
    @movie.priority = params[:priority]

    redirect to ("/movie")
  else
    raise Sinatra::NotFound
  end
end

get "/movie/:id/edit" do
  @movie = @@tmdb.find(params[:id].to_i)
  if @movie
    erb :edit_movie
  else
    raise Sinatra::NotFound
  end
end

delete "/movie/:id" do
  @movie = @@tmdb.find(params[:id].to_i)
    if @movie
      @@tmdb.remove_movie(@movie)
      redirect to ("/movie")
    else
      raise Sinatra::NotFound      
    end
  end