class Movie
  attr_accessor :id, :title, :year, :genre, :priority

  def initialize(title, year, genre, priority)
    @title    = title
    @year     = year
    @genre    = genre
    @priority = priority
  end
end