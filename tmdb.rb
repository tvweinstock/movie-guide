class Tmdb
  attr_reader :movie

  def initialize
    @movie = []
    @id = 1000
  end

  def add_title(movie)
    movie.id = @id
    @movie << movie
    @id += 1
  end

  def find(movie_id)
    @movie.find{ |movie| movie.id == movie_id }    
  end

  def remove_movie(movie)
    @movie.delete(movie)
  end

end