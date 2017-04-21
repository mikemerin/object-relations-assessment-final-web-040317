require_relative './superclass.rb'

class Rating < SuperClass

  attr_accessor :score, :viewer, :movie

  ALL = []

  def initialize(score:, viewer:, movie:)
    @score, @viewer, @movie = score, viewer, movie
    ALL << self
  end

end



# require_relative './superclass.rb'
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
#   def self.all() ALL end
#
# end
