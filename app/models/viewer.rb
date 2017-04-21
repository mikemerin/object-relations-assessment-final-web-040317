require_relative './superclass.rb'

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

# require_relative './superclass.rb'
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
