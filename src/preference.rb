#:require 'csv'
class Preference
  attr_accessor :opposite
  attr_accessor :percent
  attr_reader :name
  attr_reader :initials

  def initialize
    #load
  end

  def adjusted_percent
  end
  def print
  end
end

class PreferencesList
end
