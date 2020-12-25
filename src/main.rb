$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'preference'
require 'aspect'
require 'trait'
require 'optparse'
require 'sanitizer'

class Personality
  def initialize
    @prefs = PreferencesRepository.new
    @aspects = AspectsRepository.new @prefs
    @traits = TraitsRepository.new @prefs
  end

  def quick!(l)
    @aspects.quick!(l)
    display
  end
  def display()
    @traits.sorted.map(&:display).join("\n")
  end
end


per = Personality.new

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on('-l','--list_as_intj i,n,t,j',Array) do |l|
    options[:l] = l
  end
end.parse!

if options.has_key?(:l)
  l = options[:l]
  unless l.length == 4
    raise "given #{l.length} not 4"
  end
  fl = l.map(&Kernel.method(:sanitize_per))
  puts per.quick!(fl)
end
