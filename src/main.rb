require 'preference'
require 'aspect'
require 'trait'
require 'optparse'

class Personality
  def initialize
    @prefs = PreferencesRepository.new
    @aspects = AspectsRepository.new @prefs
    @traits = TraitsRepository.new @traits
  end

  def get
    @prefs,@aspects,@traits
  end
end


per = Personality.new
p,a,t= per.get

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  p.collection.
  opts.on()

  end
end.parse!
    end
end


