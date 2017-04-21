# note there are two types of solutions here:
# assignment is shown, basic is commented out

# assignment:

class SuperClass

  def self.all() self::ALL end

end

class Viewer < SuperClass

  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def self.find_by_name(name:)
    found = ALL.find { |person| "#{person.full_name}" == name }
    found.nil? ? "Sorry no viewers were found by that name." : found
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_rating(score:, movie:)
    Rating.new(score, self.full_name, movie)
  end

end

class Rating < SuperClass

  attr_accessor :score, :viewer, :movie

  ALL = []

  def initialize(score:, viewer:, movie:)
    @score, @viewer, @movie = score, viewer, movie
    ALL << self
  end

end

class Movie < SuperClass

  attr_accessor :title

  ALL = []

  def initialize(title:)
    self.title = title
    ALL << self
  end

  def self.find_by_title(title:)
    found = ALL.find { |movie| movie.title == title }
    found.nil? ? "Sorry no titles were found with that name." : found
  end

  def find_info
    Rating.all.select { |rating| rating.movie == self.title }
  end

  def ratings
    self.find_info.map { |info| info.score }
  end

  def viewers
    self.find_info.map { |rating| rating.viewer }
  end

  def average_rating
    ratings.reduce(:+).fdiv(ratings.size).round(2)
  end

end

# basic:

# class SuperClass
#
#   def self.all() self::ALL end
#
# end
#
# class Viewer < SuperClass
#
#   attr_accessor :first_name, :last_name
#
#   ALL = []
#
#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#     ALL << self
#   end
#
#   def self.find_by_name(name)
#     found = ALL.find { |person| "#{person.full_name}" == name }
#     found.nil? ? "Sorry no viewers were found by that name." : found
#   end
#
#   def full_name
#     "#{first_name} #{last_name}"
#   end
#
#   def create_rating(score, movie)
#     Rating.new(score, self.full_name, movie)
#   end
#
# end
#
# class Rating < SuperClass
#
#   attr_accessor :score, :viewer, :movie
#
#   ALL = []
#
#   def initialize(score, viewer, movie)
#     @score, @viewer, @movie = score, viewer, movie
#     ALL << self
#   end
#
# end
#
# class Movie < SuperClass
#
#   attr_accessor :title
#
#   ALL = []
#
#   def initialize(title)
#     self.title = title
#     ALL << self
#   end
#
#   def self.find_by_title(title)
#     found = ALL.find { |movie| movie.title == title }
#     found.nil? ? "Sorry no titles were found with that name." : found
#   end
#
#   def find_info
#     Rating.all.select { |rating| rating.movie == self.title }
#   end
#
#   def ratings
#     self.find_info.map { |info| info.score }
#   end
#
#   def viewers
#     self.find_info.map { |rating| rating.viewer }
#   end
#
#   def average_rating
#     ratings.reduce(:+).fdiv(ratings.size).round(2)
#   end
#
# end
