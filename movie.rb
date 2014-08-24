class Movie
  attr_accessor :id, :title, :year, :genre
  
  def initialize(title, year, genre)
    @title = title
    @year = year
    @genre = genre    
  end
end