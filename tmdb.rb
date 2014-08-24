class Tmdb
  attr_reader :movie

  def initialize
    @movie = []
    @id = 1000
  end

  def add_title(movie)
    movie.id = @id
    @movie << movie
    @id +=
  end

end