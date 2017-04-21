require_relative './superclass.rb'

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

# require_relative './superclass.rb'
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
