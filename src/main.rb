require 'preference'
require 'aspect'
require 'trait'
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

