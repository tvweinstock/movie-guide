require 'sinatra'
require 'data_mapper'


DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Movie
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :year, String
  property :genre, String
  # property :priority, Serial
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  @movie_app_name = "Tobflix"
  erb :index
end

get '/movie' do
  @movie = Movie.all
  erb :movies
end

post '/movie' do
  movie = Movie.create(
    :title => params[:title], 
    :year => params[:year], 
    :genre => params[:genre], 
    # :priority => params[:priority]
    )  
  redirect to ('/movie')
end

get '/movie/new' do
  erb :new_movie
end

get "/movie/:id" do
  @movie = Movie.get(params[:id].to_i)
  if @movie
    erb :show_movie
  else Sinatra::NotFound
  end
end

get "/movie/:id/edit" do
  @movie = Movie.get(params[:id].to_i)
  if @movie
    erb :edit_movie
  else
    raise Sinatra::NotFound
  end
end

put "/movie/:id" do 
  @movie = Movie.get(params[:id].to_i)
  if @movie
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.genre = params[:genre]
    # @movie.priority = params[:priority]

    @movie.save

    redirect to ("/movie")
  else
    raise Sinatra::NotFound
  end
end


delete "/movie/:id" do
  @movie = Movie.get(params[:id].to_i)
  if @movie
    @movie.destroy
    redirect to ("/movie")
  else
    raise Sinatra::NotFound      
  end
end