require 'preference'
require 'aspect'
require 'trait'
require 'optparse'
require 'sanitizer'

class Personality
  def initialize
    @prefs = PreferencesRepository.new
    @aspects = AspectsRepository.new @prefs
    @traits = TraitsRepository.new @traits
  end

  def quick(l)
    @aspects.set_all_percent(l)
  end
  def print()
  end
end


per = Personality.new

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on('--list_as_intj i,n,t,j',Array) do |l|
    options{:l} = l
  end
end.parse!

if options.has_key?(:l)
  l = options[:l]
  unless l.length == 4
    raise "given #{l.length} not 4"
  end
  fl = l.map(&:sanitize_per)
  puts per.quick(l)
end
